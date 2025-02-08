//
//  SignInController.swift
//  StakeApp
//
//  Created by Gio's Mac on 16.01.25.
//

import UIKit
import SnapKit
import AuthenticationServices
import Alamofire
import ProgressHUD

class SignInController: UIViewController {
    private lazy var mainImageConsole: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "signinViewImage")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var wImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "wImage")
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(60)
        return view
    }()

    private lazy var fastAndSecureTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Fast and secure \n authorization"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        view.numberOfLines = 2
        return view
    }()

    private lazy var fastAndSecureInfo: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Authorize via Apple ID to save your progress, achievements and predictions. Fast, secure, no extra data."
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.montserratVariableFontWght(size: 14)
        view.textAlignment = .left
        view.numberOfLines = 3
        return view
    }()

    private lazy var benefitView: BenefitsView = {
        let view = BenefitsView()
        view.accountImageLabel.middleLabel.textColor = .whiteColor
        view.savingLessonsLabel.middleLabel.textColor = .whiteColor
        view.securityLabel.middleLabel.textColor = .whiteColor
        return view
    }()

    private lazy var signInWithAppleButton: UIButton = {
        let view = UIButton(frame: .zero)
            view.setTitle("Sign in with apple", for: .normal)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.backgroundColor = UIColor.signInButtonBackgroundColor
            view.makeRoundCorners(16)
        view.titleLabel?.font = UIFont.goldmanBold(size: 14)
            let image = UIImage(named: "apple")?.withRenderingMode(.alwaysOriginal)
            let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 24, height: 24)).image { _ in
                image?.draw(in: CGRect(origin: .zero, size: CGSize(width: 24, height: 24)))
            }
            view.setImage(resizedImage, for: .normal)
            view.imageView?.contentMode = .scaleAspectFit
            view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
            view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            view.contentHorizontalAlignment = .center
            view.addTarget(self, action: #selector(clickSignInWithAppleButton), for: .touchUpInside)
            return view
    }()

    private lazy var skipButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sign in as a guest ", for: .normal)
        view.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.15)
        view.titleLabel?.font = UIFont.goldmanBold(size: 14)
        view.makeRoundCorners(16)
        view.addTarget(self, action: #selector(clickSkipButton), for: .touchUpInside)
        return view
    }()

    private lazy var termsButton: UIButton = {
        let view = UIButton(frame: .zero)
        let attributedTitle = NSAttributedString(
            string: "Terms of Use",
            attributes: [
                .font: UIFont.montserratVariableFontWght(size: 12),
                .foregroundColor: UIColor.whiteColor,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        view.setAttributedTitle(attributedTitle, for: .normal)
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(clickTermsButton), for: .touchUpInside)
        return view
    }()

    private lazy var privacyPolicyButton: UIButton = {
        let view = UIButton(frame: .zero)
        let attributedTitle = NSAttributedString(
            string: "Privacy Policy",
            attributes: [
                .font: UIFont.montserratVariableFontWght(size: 12),
                .foregroundColor: UIColor.whiteColor,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        view.setAttributedTitle(attributedTitle, for: .normal)
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(clickPrivacyPolicyButton), for: .touchUpInside)
        return view
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainViewsBackViewBlack

        setup()
        setupConstraints()
    }

    private func setup() {
        view.addSubview(mainImageConsole)
        mainImageConsole.addSubview(wImage)
        view.addSubview(fastAndSecureTitle)
        view.addSubview(fastAndSecureInfo)
        view.addSubview(signInWithAppleButton)
        view.addSubview(benefitView)
        view.addSubview(skipButton)
        view.addSubview(termsButton)
        view.addSubview(privacyPolicyButton)
    }

    private func setupConstraints() {
        mainImageConsole.snp.remakeConstraints { make in
//            make.top.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(-20)
            make.leading.equalTo(view.snp.leading).offset(-20)
            make.trailing.equalTo(view.snp.trailing).offset(20)
            make.height.equalTo(380 * Constraint.yCoeff)
        }

        wImage.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(137)
            make.centerX.equalTo(view.snp.centerX)
            make.height.width.equalTo(140)
        }

        fastAndSecureTitle.snp.remakeConstraints { make in
            make.top.equalTo(wImage.snp.bottom).offset(74)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(45 * Constraint.yCoeff)
            make.width.equalTo(250 * Constraint.xCoeff)
        }

        fastAndSecureInfo.snp.remakeConstraints { make in
            make.top.equalTo(fastAndSecureTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(51 * Constraint.yCoeff)
        }

        benefitView.snp.remakeConstraints { make in
            make.top.equalTo(fastAndSecureInfo.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(86)
        }

        signInWithAppleButton.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-150 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(52 * Constraint.yCoeff)
        }

        skipButton.snp.remakeConstraints { make in
            make.top.equalTo(signInWithAppleButton.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(52 * Constraint.yCoeff)
        }

        termsButton.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-32 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(15 * Constraint.yCoeff)
        }

        privacyPolicyButton.snp.remakeConstraints { make in
            make.centerY.equalTo(termsButton.snp.centerY)
            make.trailing.equalTo(view.snp.trailing).offset(-20 * Constraint.xCoeff)
            make.height.equalTo(15 * Constraint.yCoeff)
        }

    }

    @objc private func clickTermsButton() {

    }

    @objc private func clickPrivacyPolicyButton() {

    }

    @objc private func clickSkipButton() {
        UserDefaults.standard.setValue(true, forKey: "isGuestUser")

        UserDefaults.standard.removeObject(forKey: "userId")
        UserDefaults.standard.removeObject(forKey: "AccountCredential")

        let mainViewTabBarController = MainViewControllerTab()
        navigationController?.pushViewController(mainViewTabBarController, animated: true)
    }

    @objc private func clickSignInWithAppleButton() {
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
                        let mainViewController = MainScreenView()
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

extension SignInController: ASAuthorizationControllerDelegate /*ASAuthorizationControllerPresentationContextProviding*/ {
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

