//
//  TutorialView.swift
//  1win
//
//  Created by Gio's Mac on 08.02.25.
//

import UIKit
import SnapKit

class TutorialController: UIViewController {

    private var filteredTrainings: [TrainingModel] = []
    private var isSearching = false

    private var trainings: [TrainingModel] = []


    lazy var searchBarView: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.placeholder = "Search..."
        view.searchBarStyle = .minimal
        view.tintColor = .whiteColor
        view.searchTextField.backgroundColor = UIColor.viewControllerBackgroundColor
        view.searchTextField.textColor = .whiteColor.withAlphaComponent(0.5)
        view.searchTextField.font = UIFont.goldmanBold(size: 14)
        view.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.whiteColor.withAlphaComponent(0.5)]
        )
        view.makeRoundCorners(22)
        view.clipsToBounds = true
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


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#1E1D23")
        setup()
        setupConstraints()

        loadTrainings(game: "All")

        setupHierarchy()
        configureCompositionLayout()
    }

    func setupHierarchy() {
        collectionView.register(GameChooseCell.self, forCellWithReuseIdentifier: String(describing: GameChooseCell.self))
        collectionView.register(AllTrainingCell.self, forCellWithReuseIdentifier: String(describing: AllTrainingCell.self))
        collectionView.register(AllTrainingHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AllTrainingHeaderView.identifier)
    }

    private func setup() {
        view.addSubview(searchBarView)
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        searchBarView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(64 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(44 * Constraint.yCoeff)
        }

        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(searchBarView.snp.bottom).offset(28 * Constraint.yCoeff)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    @objc private func pressBackButton() {
        navigationController?.popViewController(animated: true)
    }

    private func loadTrainings(game: String) {
        switch game {
        case "CS:GO":
            trainings = trainingsCS
        case "Dota 2":
            trainings = trainingsDota2
        case "LoL":
            trainings = trainingsLoL
        case "Valorant":
            trainings = trainingsValorant
        default:
            trainings = trainingsCS + trainingsDota2 + trainingsLoL + trainingsValorant
        }
        collectionView.reloadData()
    }

    func configureCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in

            switch sectionIndex {
            case 0:
                return self?.gameChooseView()
            case 1:
                return self?.allTrainingView()
            default:
                return self?.defaultLayout()
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }

    func gameChooseView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 8 * Constraint.yCoeff,
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


extension TutorialController: UICollectionViewDelegate, UICollectionViewDataSource {
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
                withReuseIdentifier: String(describing: GameChooseCell.self),
                for: indexPath) as? GameChooseCell else {
                return UICollectionViewCell()
            }
            cell.didSelectGame = { [weak self] selectedGame in
                self?.loadTrainings(game: selectedGame)
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
}

extension TutorialController: UISearchBarDelegate {
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
