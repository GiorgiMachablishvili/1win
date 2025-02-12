//
//  CSGameController.swift
//  1win
//
//  Created by Gio's Mac on 11.02.25.
//

import UIKit
import SnapKit

class CSGameController: UIViewController {

    private lazy var searchTrainingView: SearchView = {
        let view = SearchView()
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
            return 3
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
