//
//  TournamentDetailsView.swift
//  1win
//
//  Created by Gio's Mac on 10.02.25.
//

import UIKit
import SnapKit

class TournamentDetailsView: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = UIColor(hexString: "#17191D")
        return view
    }()

    private lazy var selectTheCommand: SelectTheCommand = {
        let view = SelectTheCommand()
        view.isHidden = true
        view.makeRoundCorners(32)
        view.backgroundColor = UIColor.viewBackgroundColor
        view.didPressCloseButton = { [weak self] in
            self?.hideSelectTheCommandView()
        }
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
        collectionView.register(TournamentDescriptionCell.self, forCellWithReuseIdentifier: String(describing: TournamentDescriptionCell.self))
        collectionView.register(TournamentInfo.self, forCellWithReuseIdentifier: String(describing: TournamentInfo.self))
        collectionView.register(TournamentParticipantsCell.self, forCellWithReuseIdentifier: String(describing: TournamentParticipantsCell.self))
    }

    private func setup() {
        view.addSubview(collectionView)
        view.addSubview(selectTheCommand)
    }

    private func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(-55)
            make.leading.trailing.bottom.equalToSuperview()
        }

        selectTheCommand.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(105 * Constraint.yCoeff)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    func configureCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in

            switch sectionIndex {
            case 0:
                return self?.detailsView()
            case 1:
                return self?.descriptionView()
            case 2:
                return self?.tournamentsRaiting()
            default:
                return self?.defaultLayout()
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }

    func detailsView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(364 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(364 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 0 * Constraint.yCoeff,
            leading: 0 * Constraint.xCoeff,
            bottom: 16 * Constraint.yCoeff,
            trailing: 0 * Constraint.xCoeff
        )
        return section
    }

    func descriptionView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(112 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(112 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 54 * Constraint.yCoeff,
            leading: 20 * Constraint.xCoeff,
            bottom: 0 * Constraint.yCoeff,
            trailing: 20 * Constraint.xCoeff
        )
        return section
    }

    func tournamentsRaiting() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(447 * Constraint.yCoeff))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(447 * Constraint.yCoeff)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 16 * Constraint.yCoeff,
            leading: 20 * Constraint.xCoeff,
            bottom: 50 * Constraint.yCoeff,
            trailing: 20 * Constraint.xCoeff
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

    private func unHideSelectTheCommandView () {
        let viewVC = MainScreenView()
        selectTheCommand.isHidden = false
        viewVC.hidesBottomBarWhenPushed = true
    }

    private func hideSelectTheCommandView() {
        selectTheCommand.isHidden = true
        self.hidesBottomBarWhenPushed = false
    }

    private func goBackPage() {
        navigationController?.popViewController(animated: true)
    }

}


extension TournamentDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: TournamentDescriptionCell.self),
                for: indexPath) as? TournamentDescriptionCell else {
                return UICollectionViewCell()
            }
            cell.didPressBackButton = { [weak self] in
                self?.goBackPage()
            }

            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: TournamentInfo.self),
                for: indexPath) as? TournamentInfo else {
                return UICollectionViewCell()
            }

            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: TournamentParticipantsCell.self),
                for: indexPath) as? TournamentParticipantsCell else {
                return UICollectionViewCell()
            }
            cell.didPressVoteButton = { [weak self] in
                guard let self = self else { return }
                self.unHideSelectTheCommandView()
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    
}
