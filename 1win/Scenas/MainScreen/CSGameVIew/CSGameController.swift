//
//  CSGameController.swift
//  1win
//
//  Created by Gio's Mac on 11.02.25.
//

import UIKit
import SnapKit

class CSGameController: UIViewController {

    private var filteredTrainings: [TrainingModel] = []
    private var isSearching = false

    private lazy var searchTrainingView: SearchView = {
        let view = SearchView()
        view.didPressBackButton = { [weak self] in
            self?.pressBackButton()
        }
        view.searchBarView.delegate = self 
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = UIColor(hexString: "#1E1D23")
        return view
    }()

    private let trainings: [TrainingModel] = [
        TrainingModel(image: "MAETactic", title: "The Mirage A Execution", description: "The \("Mirage A Execution") is a well-coordinated strategy designed to take over the A bombsite using utility to block key angles and create openings for a strong execute. By using Smokes, Molotovs, and Flashbangs, the Terrorist side can isolate defenders and gain control of the site efficiently.", steps: "1.Set Up in T-Spawn & A-Ramp: Three players position near A-Ramp, one near Palace, and one towards Mid. \n 2.Smokes and Molotovs: Players throw Smokes for Jungle, CT, and Stairs while a Molotov lands on Default.\n 3.Flashes Over A: Teammates throw two high Flashes over A to blind any defenders peeking. \n 4.Push the Site: Ramp and Palace players enter simultaneously, clearing Default, Triple, and Ticket Booth. \n 5.Plant the Bomb: Plant for A-Ramp or Palace while maintaining post-plant positions in Jungle, Ramp, and Sandwich.", advantage: " Forces CTs into defensive positions, preventing early aggression. \n Reduces risk of getting picked off by an AWP due to Smoke cover.\n Provides a strong post-plant setup with crossfire positions."),
        TrainingModel(image: "SFMTactic", title: "B Split from Mid", description: "The \("B Split from Mid") is a powerful T-side strategy that applies pressure on Mid while splitting towards the B bombsite from both Catwalk and B Apartments. This tactic is effective against CTs who overcommit to Mid control and can overwhelm B defenders with a fast-paced attack.", steps: "1.Take Mid Control: Three players move towards Mid (two Top Mid, one Underpass).\n 2.Use Smokes and Flashes: Smokes are thrown for Window, Connector, and Short to block CT vision.\n 3.Catwalk Players Push B: The two Mid players advance towards Catwalk while using a Flash to enter. \n 4.B Apartments Players Execute: Two players push out B Apartments with a Flash and Molotov on Van. \n 5.Clear Site & Plant the Bomb: Catwalk and Apartments players converge to take out any CTs on site. \n 6.Hold Post-Plant Positions: One player holds Market, one watches Cat, and the rest position on B Site.", advantage: "Divides CTs and weakens their defensive setup. \n Overwhelms B Site with a coordinated attack. \n Makes it difficult for CTs to retake due to split angles."),
        TrainingModel(image: "FARTactic", title: "A Fake into B Rush", description: "This strategy is designed to bait the CTs into over-rotating to A, leaving B vulnerable to a fast rush. The goal is to make the A attack look convincing before quickly shifting to B.", steps: "1.Set Up the A Fake: Three players move towards A Ramp and Palace while two players stay near B Apartments.\n 2.Throw A Site Smokes & Flashes: Smokes land on Stairs, Jungle, and CT Spawn. Flashbangs blind the A defenders.\n 3.Make Noise and Apply Pressure: The A players fire shots, throw Molotovs, and possibly get an early kill if possible.\n 4.Suddenly Rotate to B: After about 5-7 seconds, the A players retreat silently while the B players get ready to rush.\n 5.Fast Execute into B Site: The B players Flash over, Molotov Van, and push hard while A players rotate through Mid to cut off Market.\n 6.Plant the Bomb & Hold: The team takes post-plant positions, covering Market, Catwalk, and Apartments.", advantage: "Forces CTs to rotate to A, weakening B Site. \n A fast B rush after the fake often catches defenders off guard. \n High success rate if the fake is sold convincingly."),
        TrainingModel(image: "MCTSTactic", title: "Mid Control to A Split", description: "This tactic focuses on gaining control of the middle area to pressure both bomb sites and then executing a split attack on A. By taking Mid, the Ts can create multiple angles of attack, overwhelming the CT defense.", steps: "1.Mid Presence: Three players take control of Mid using smokes (Window and Connector) and flashes. Two players stay near A Ramp and Palace. \n 2.Apply Pressure on Mid: One player holds Underpass, one holds Top Mid, and another advances Catwalk or boosts into Window if possible. \n 3.Clear Connector and Short: The Mid players apply pressure, possibly using a Molotov to flush out a Connector player. \n 4.Coordinate the A Split: Mid players push through Connector while the A players move in from Ramp and Palace simultaneously. \n 5.Throw Utility for A Take: Smokes land on Stairs, Jungle, and CT Spawn while Flashbangs blind defenders. \n 6.Take A Site and Plant: After securing the site, plant the bomb in a safe spot, preferably default or triple. \n 7.Hold Post-Plant Positions: Players take control of Jungle, CT Spawn, and A Main to cut off retake attempts.", advantage: "Forces CTs to defend A from multiple angles. \n Gains control of Mid, limiting CT rotations. \n Strong post-plant positions for a successful round."),
        TrainingModel(image: "FIXTactic", title: "B Fake into A Execute", description: "This strategy is designed to trick the CTs into thinking the Terrorists (Ts) are executing a full B rush while the real attack is focused on A. The idea is to create chaos and force rotations, leaving A weaker and vulnerable.", steps: "1.Set Up for the Fake: Three Ts position themselves near B Apartments, while two stay near A Ramp and Palace. \n 2.B Fake Begins: The B players throw deep smokes (Market and Short) and Molotovs to create pressure. \n 3.Commit to the Fake: One or two Ts jump down from Apartments and start engaging defenders, throwing flashes and shooting aggressively. \n 4.Lurker Stays on B: One T remains near B Apartments to delay CT rotations. \n 5.A Execution Starts: While the B fake is happening, the A players execute onto A, throwing smokes (Jungle, CT, Stairs) and flashing into the site. \n 6.Plant the Bomb at A: Secure the site and get the bomb down in a strong post-plant position. \n 7.Hold A Defensively: Take control of Jungle, CT, and Ramp while the last player on B rotates back through Mid or T-Spawn.", advantage: "Forces multiple CTs to rotate off A, making the execution easier. \n Provides a strong post-plant scenario with good map control. \n Hard to counter unless CTs play very disciplined and don't over-rotate.")
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#1E1D23")
        setup()
        setupConstraints()

        setupHierarchy()
        configureCompositionLayout()
    }

    func setupHierarchy() {
        collectionView.register(PopularTrainingCell.self, forCellWithReuseIdentifier: String(describing: PopularTrainingCell.self))
        collectionView.register(AllTrainingCell.self, forCellWithReuseIdentifier: String(describing: AllTrainingCell.self))
        collectionView.register(AllTrainingHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AllTrainingHeaderView.identifier)
    }

    private func setup() {
        view.addSubview(searchTrainingView)
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        searchTrainingView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(108 * Constraint.yCoeff)
        }

        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(searchTrainingView.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    @objc private func pressBackButton() {
        navigationController?.popViewController(animated: true)
    }

    func configureCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in

            switch sectionIndex {
            case 0:
                return self?.popularTrainingView()
            case 1:
                return self?.allTrainingView()
            default:
                return self?.defaultLayout()
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }

    func popularTrainingView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(210 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(210 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 16 * Constraint.yCoeff,
            leading: 20 * Constraint.xCoeff,
            bottom: 32 * Constraint.yCoeff,
            trailing: 20 * Constraint.xCoeff
        )
        return section
    }

    func allTrainingView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(85 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(85 * Constraint.yCoeff))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 16 * Constraint.yCoeff,
            leading: 20 * Constraint.xCoeff,
            bottom: 0 * Constraint.yCoeff,
            trailing: 20 * Constraint.xCoeff
        )
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(25)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]

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
}

extension CSGameController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return isSearching ? filteredTrainings.count : trainings.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: PopularTrainingCell.self),
                for: indexPath) as? PopularTrainingCell else {
                return UICollectionViewCell()
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: AllTrainingCell.self),
                for: indexPath) as? AllTrainingCell else {
                return UICollectionViewCell()
            }
            let training = isSearching ? filteredTrainings[indexPath.item] : trainings[indexPath.item]
            cell.configure(with: training)
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }

        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "AllTrainingHeaderView", for: indexPath) as? AllTrainingHeaderView else {
            return UICollectionReusableView()
        }
        return header
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.hidesBottomBarWhenPushed = true
        if indexPath.section == 1 {
            let selectedTraining = isSearching ? filteredTrainings[indexPath.item] : trainings[indexPath.item]
//            let selectedTraining = trainings[indexPath.item]

            // Shuffle and take 5 random questions from the entire quizData array
            let randomQuestions = Array(quizData.shuffled().prefix(5))

            // Show the quiz view with selected questions
            let currentTrainingVC = CurrentTrainingController(training: selectedTraining, questions: randomQuestions)
            navigationController?.pushViewController(currentTrainingVC, animated: true)
        }
    }
}

// MARK: - UISearchBar Delegate
extension CSGameController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredTrainings.removeAll()
        } else {
            isSearching = true
            filteredTrainings = trainings.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        collectionView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        isSearching = false
        filteredTrainings.removeAll()
        collectionView.reloadData()
    }
}
