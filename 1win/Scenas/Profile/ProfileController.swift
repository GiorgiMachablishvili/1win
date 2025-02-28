//
//  ProfileView.swift
//  1win
//
//  Created by Gio's Mac on 08.02.25.
//

import UIKit
import SnapKit
import AuthenticationServices
import Alamofire
import ProgressHUD
import StoreKit

class ProfileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var selectedImage: UIImage?

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = UIColor(hexString: "#17191D")
        return view
    }()

    private lazy var backgroundProfileView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear.withAlphaComponent(0.5)
        view.isHidden = true
        return view
    }()

    private lazy var achievementView: AchievementsView = {
        let view = AchievementsView()
        view.didPressCancelButton = { [weak self] in
            self?.hideAchievementView()
        }
        view.isHidden = true
        return view
    }()


    private lazy var profileView: EditProfileView = {
        let view = EditProfileView()
        view.makeRoundCorners(20)
        view.backgroundColor = .pointViewColor
        view.isHidden = true
        view.didPressSaveButton = { [weak self] in
            self?.updateUserInfo()
        }
        view.didPressCancelButton = { [weak self] in
            self?.hideView()
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        setupHierarchy()
        configureCompositionLayout()
    }

    func setupHierarchy() {
        collectionView.register(ChangeImageCell.self, forCellWithReuseIdentifier: String(describing: ChangeImageCell.self))
        collectionView.register(AchievementsCell.self, forCellWithReuseIdentifier: String(describing: AchievementsCell.self))
        collectionView.register(LinksCell.self, forCellWithReuseIdentifier: String(describing: LinksCell.self))
        collectionView.register(CreateAndDeleteCell.self, forCellWithReuseIdentifier: String(describing: CreateAndDeleteCell.self))
    }

    private func setup() {
        view.addSubview(collectionView)
        view.addSubview(backgroundProfileView)
        backgroundProfileView.addSubview(achievementView)
        backgroundProfileView.addSubview(profileView)
    }

    private func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        achievementView.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(80 * Constraint.yCoeff)
            make.height.equalTo(478 * Constraint.yCoeff)
        }

        backgroundProfileView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        profileView.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(80 * Constraint.yCoeff)
            make.height.equalTo(478 * Constraint.yCoeff)
        }
    }

    private func hideAchievementView() {
        backgroundProfileView.isHidden = true
        achievementView.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }

    //TODO: add links
    private func securityPolisy() {
        let termsURL = ""
        let webViewController = WebViewController(urlString: termsURL)
        navigationController?.present(webViewController, animated: true)
    }

    private func shareApp() {
        let termsURL = ""
        let webViewController = WebViewController(urlString: termsURL)
        navigationController?.present(webViewController, animated: true)
    }

    private func conditionsOfUse() {
        let termsURL = ""
        let webViewController = WebViewController(urlString: termsURL)
        navigationController?.present(webViewController, animated: true)
    }

    private func privacyPolicy() {
        let termsURL = ""
        let webViewController = WebViewController(urlString: termsURL)
        navigationController?.present(webViewController, animated: true)
    }

    private func rateApp() {
        if let windowScene = view.window?.windowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }

    @objc private func updateUserInfo() {
        //TODO: uncomment when connect with back
//        guard let userId = UserDefaults.standard.value(forKey: "userId") as? Int else {
//            print("userId not found or not an Int")
//            return
//        }
//        // Get the selected image and nickname from the profile view
//        let selectedImage = profileView.selectedImage
//        let nickname = profileView.nicknameTextField.text
//
//        // Show loading indicator
//        NetworkManager.shared.showProgressHud(true, animated: true)
//
//        // Send the PATCH request
//        NetworkManager.shared.updateUserProfile(userId: userId, image: selectedImage, nickname: nickname) { [weak self] result in
//            guard let self = self else { return }
//
//            DispatchQueue.main.async {
//                NetworkManager.shared.showProgressHud(false, animated: false)
//            }
//
//            switch result {
//            case .success(let userData):
//                // Update the UI with the new user data
//                self.userData = userData
//                DispatchQueue.main.async {
//                    self.hideView() // Hide the edit profile view
//                    self.collectionView.reloadData()
//                }
//            case .failure(let error):
//                print("Failed to update user profile: \(error)")
//                // Show an error message to the user
//                self.showAlert(title: "Error", message: "Failed to update profile. Please try again.")
//            }
//        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }

    @objc private func hideView() {
        backgroundProfileView.isHidden = true
        profileView.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }

    func configureCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in

            switch sectionIndex {
            case 0:
                return self?.changeProfileImageView()
            case 1:
                return self?.achievementsView()
            case 2:
                return self?.linksView()
            case 3:
                return self?.createAndDeleteButtons()
            default:
                return self?.defaultLayout()
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }

    func changeProfileImageView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(260 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(260 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 0 * Constraint.yCoeff,
            leading: 0 * Constraint.xCoeff,
            bottom: 0 * Constraint.yCoeff,
            trailing: 0 * Constraint.xCoeff
        )
        return section
    }

    func achievementsView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(70 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(70 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 16 * Constraint.yCoeff,
            leading: 20 * Constraint.xCoeff,
            bottom: 0 * Constraint.yCoeff,
            trailing: 20 * Constraint.xCoeff
        )
        return section
    }

    func linksView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(244 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(244 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 16 * Constraint.yCoeff,
            leading: 0 * Constraint.xCoeff,
            bottom: 0 * Constraint.yCoeff,
            trailing: 0 * Constraint.xCoeff
        )
        return section
    }

    func createAndDeleteButtons() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(60 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(60 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 16 * Constraint.yCoeff,
            leading: 0 * Constraint.xCoeff,
            bottom: 0 * Constraint.yCoeff,
            trailing: 0 * Constraint.xCoeff
        )
        return section
    }

    func defaultLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.7),
            heightDimension: .absolute(200 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    private func signInButton() {
        // Simulating tokens for testing
        let mockPushToken = "mockPushToken"
        let mockAppleToken = "mockAppleToken"

        // Store mock tokens in UserDefaults
        UserDefaults.standard.setValue(mockPushToken, forKey: "PushToken")
        UserDefaults.standard.setValue(mockAppleToken, forKey: "AccountCredential")

        // Call createUser to simulate user creation
        createUser()

        //        let authorizationProvider = ASAuthorizationAppleIDProvider()
        //        let request = authorizationProvider.createRequest()
        //        request.requestedScopes = [.email, .fullName]
        //
        //        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        //        authorizationController.delegate = self
        //        authorizationController.performRequests()
        //        let mainView = MainDashboardScene()
        //        navigationController?.pushViewController(mainView, animated: true)
    }

    private func createUser() {
        NetworkManager.shared.showProgressHud(true, animated: true)

        let pushToken = UserDefaults.standard.string(forKey: "PushToken") ?? ""
        let appleToken = UserDefaults.standard.string(forKey: "AccountCredential") ?? ""

        // Prepare parameters
        let parameters: [String: Any] = [
            "push_token": pushToken,
            "apple_token": appleToken,
        ]

        // Make the network request
        NetworkManager.shared.post(
            url: String.userCreate(),
            parameters: parameters,
            headers: nil
        ) { [weak self] (result: Result<UserCreate>) in
            guard let self = self else { return }

            DispatchQueue.main.async {
                NetworkManager.shared.showProgressHud(false, animated: false)
                UserDefaults.standard.setValue(false, forKey: "isGuestUser")
            }
            print("\(parameters)")
            switch result {
            case .success(let userInfo):
                DispatchQueue.main.async {
                    print("User created: \(userInfo)")
                    UserDefaults.standard.setValue(userInfo.id, forKey: "userId")
                    print("Received User ID: \(userInfo.id)")

                    if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                        let mainViewController = MainScreenController()
                        let navigationController = UINavigationController(rootViewController: mainViewController)
                        sceneDelegate.changeRootViewController(navigationController)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Error", description: error.localizedDescription)
                }
                print("Error: \(error)")
            }
        }
    }

    private func showAlert(title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension ProfileController: ASAuthorizationControllerDelegate /*ASAuthorizationControllerPresentationContextProviding*/ {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }

        UserDefaults.standard.setValue(credential.user, forKey: "AccountCredential")
        //        createUser()
    }

    //    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    //        print("Authorization failed: \(error.localizedDescription)")
    //        showAlert(title: "Sign In Failed", description: error.localizedDescription)
    //    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        let nsError = error as NSError
        if nsError.domain == ASAuthorizationError.errorDomain {
            switch nsError.code {
            case ASAuthorizationError.canceled.rawValue:
                print("User canceled the Apple Sign-In process.")
                // Optionally show a message or simply return
                return
            case ASAuthorizationError.failed.rawValue:
                print("Sign-In failed.")
                showAlert(title: "Sign In Failed", description: "Something went wrong. Please try again.")
            case ASAuthorizationError.invalidResponse.rawValue:
                print("Invalid response from Apple Sign-In.")
                showAlert(title: "Invalid Response", description: "We couldn't authenticate you. Please try again.")
            case ASAuthorizationError.notHandled.rawValue:
                print("Apple Sign-In not handled.")
                showAlert(title: "Not Handled", description: "The request wasn't handled. Please try again.")
            case ASAuthorizationError.unknown.rawValue:
                print("An unknown error occurred.")
                showAlert(title: "Unknown Error", description: "An unknown error occurred. Please try again.")
            default:
                break
            }
        } else {
            print("Authorization failed with error: \(error.localizedDescription)")
            showAlert(title: "Sign In Failed", description: error.localizedDescription)
        }
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

extension ProfileController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: ChangeImageCell.self),
                for: indexPath) as? ChangeImageCell else {
                return UICollectionViewCell()
            }
            cell.didPressEditProfileButton = { [weak self] image in
                guard let self = self else { return }
                self.backgroundProfileView.isHidden = false
                self.profileView.isHidden = false
                self.tabBarController?.tabBar.isHidden = true

                // Pass the image to EditProfileView
                self.profileView.workoutImage.image = image
                self.profileView.selectedImage = image
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: AchievementsCell.self),
                for: indexPath) as? AchievementsCell else {
                return UICollectionViewCell()
            }
            cell.didSelectAchievement = { [weak self] title, imageName, description in
                guard let self = self else { return }
                self.showAchievementDetail(title: title, imageName: imageName, description: description)
                self.tabBarController?.tabBar.isHidden = true
            }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: LinksCell.self),
                for: indexPath) as? LinksCell else {
                return UICollectionViewCell()
            }
            cell.didSecurityPolicyButtonButton = { [weak self] in
                self?.securityPolisy()
            }
            cell.didShareAppTappedButton = { [weak self] in
                self?.shareApp()
            }
            cell.didConditionsOfUseButton = { [weak self] in
                self?.conditionsOfUse()
            }
            cell.didPrivacyPolicyButton = { [weak self] in
                self?.privacyPolicy()
            }
            cell.didPressRateButton = { [weak self] in
                self?.rateApp()
            }
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: CreateAndDeleteCell.self),
                for: indexPath) as? CreateAndDeleteCell else {
                return UICollectionViewCell()
            }
            cell.didPressSighInButton = { [weak self] in
                self?.signInButton()
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    private func showAchievementDetail(title: String, imageName: String, description: String) {
        achievementView.setAchievementDetails(title: title, imageName: imageName, description: description)
        achievementView.isHidden = false
        backgroundProfileView.isHidden = false
    }

    private func showImagePickerOptions() {
            let alertController = UIAlertController(title: "Select Profile Picture", message: nil, preferredStyle: .actionSheet)

            alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] _ in
                self?.openImagePicker(sourceType: .camera)
            }))

            alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { [weak self] _ in
                self?.openImagePicker(sourceType: .photoLibrary)
            }))

            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

            present(alertController, animated: true)
        }

        /// Opens the image picker with the specified source type
        private func openImagePicker(sourceType: UIImagePickerController.SourceType) {
            guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
                print("Source type not available")
                return
            }

            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = sourceType
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true)
        }

        /// Handles selected image from the picker
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let editedImage = info[.editedImage] as? UIImage {
                selectedImage = editedImage
            } else if let originalImage = info[.originalImage] as? UIImage {
                selectedImage = originalImage
            }

            collectionView.reloadData()
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
}
