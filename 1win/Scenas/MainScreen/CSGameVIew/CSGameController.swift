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
    private var trainings: [TrainingModel] = []

    private var gameType: String
    init(gameType: String) {
        self.gameType = gameType
        super.init(nibName: nil, bundle: nil)
        setupTrainingData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

    private func setupTrainingData() {
        if gameType == "CS" {
            trainings = trainingsCS
        } else if gameType == "Dota2" {
            trainings = trainingsDota2.map { $0 as TrainingModel }
        } else if gameType == "LOL" {
            trainings = trainingsLoL.map { $0 as TrainingModel }
        } else if gameType == "Valorant" {
            trainings = trainingsValorant.map { $0 as TrainingModel }
        }
    }

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
            cell.trainings = Array(trainings.prefix(3))
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
            let selectedTraining: TrainingModel = isSearching ? filteredTrainings[indexPath.item] : trainings[indexPath.item]

            // ✅ Select the correct quiz dataset based on the game type
            let selectedQuizData: [QuizQuestion]
            switch gameType {
            case "Dota2":
                selectedQuizData = quizDota2Data
            case "LOL":
                selectedQuizData = quizLoLData
            case "Valorant":
                selectedQuizData = quizValorantData
            default:
                selectedQuizData = quizCSData
            }

            // ✅ Shuffle and take 5 random questions
            let randomQuestions = Array(selectedQuizData.shuffled().prefix(5))

            // ✅ Show the quiz view with selected questions
            let currentTrainingVC = CurrentTrainingController(training: selectedTraining, questions: randomQuestions, gameType: gameType)
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
