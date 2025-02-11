//
//  CSGameController.swift
//  1win
//
//  Created by Gio's Mac on 11.02.25.
//

import UIKit
import SnapKit

class CSGameController: UIViewController {
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
        setup()
        setupConstraints()

        setupHierarchy()
        configureCompositionLayout()
    }

    func setupHierarchy() {
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: String(describing: SearchCell.self))
        collectionView.register(PopularTrainingCell.self, forCellWithReuseIdentifier: String(describing: PopularTrainingCell.self))
//        collectionView.register(CreateAndDeleteCell.self, forCellWithReuseIdentifier: String(describing: CreateAndDeleteCell.self))
    }

    private func setup() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configureCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in

            switch sectionIndex {
            case 0:
                return self?.searchView()
            case 1:
                return self?.popularTrainingView()
//            case 2:
//                return self?.createAndDeleteButtons()
            default:
                return self?.defaultLayout()
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }

    func searchView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(108 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(108 * Constraint.yCoeff)
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
            bottom: 0 * Constraint.yCoeff,
            trailing: 20 * Constraint.xCoeff
        )
        return section
    }

//    func createAndDeleteButtons() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(60 * Constraint.yCoeff))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(60 * Constraint.yCoeff)
//        )
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = .init(
//            top: 16 * Constraint.yCoeff,
//            leading: 0 * Constraint.xCoeff,
//            bottom: 0 * Constraint.yCoeff,
//            trailing: 0 * Constraint.xCoeff
//        )
//        return section
//    }

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
            return 1
//        case 2:
//            return 1
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: SearchCell.self),
                for: indexPath) as? SearchCell else {
                return UICollectionViewCell()
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: PopularTrainingCell.self),
                for: indexPath) as? PopularTrainingCell else {
                return UICollectionViewCell()
            }
            return cell
//        case 2:
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: String(describing: CreateAndDeleteCell.self),
//                for: indexPath) as? CreateAndDeleteCell else {
//                return UICollectionViewCell()
//            }
//            return cell
        default:
            return UICollectionViewCell()
        }
    }




}
