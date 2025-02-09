//
//  MainScreenView.swift
//  1win
//
//  Created by Gio's Mac on 08.02.25.
//

import UIKit
import SnapKit

class MainScreenView: UIViewController {

    private lazy var upcomingTournamentsTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Upcoming tournaments "
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private lazy var seeAllButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("See all", for: .normal)
        view.backgroundColor = .clear
        view.titleLabel?.font = UIFont.goldmanBold(size: 14)
        view.addTarget(self, action: #selector(clickSeeAllButton), for: .touchUpInside)
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: 183 * Constraint.yCoeff)
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10 * Constraint.yCoeff, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(TournamentCell.self, forCellWithReuseIdentifier: "TournamentCell")
        return view
    }()

    private lazy var trainingMaterials: TrainingMaterialsView = {
        let view = TrainingMaterialsView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        setupHierarchy()
    }

    func setupHierarchy() {
        collectionView.register(TournamentCell.self, forCellWithReuseIdentifier: String(describing: TournamentCell.self))
    }

    private func setup() {
        view.addSubview(upcomingTournamentsTitle)
        view.addSubview(seeAllButton)
        view.addSubview(collectionView)
        view.addSubview(trainingMaterials)
    }

    private func setupConstraints() {
        upcomingTournamentsTitle.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(72 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(19 * Constraint.yCoeff)
        }

        seeAllButton.snp.remakeConstraints { make in
            make.center.equalTo(upcomingTournamentsTitle.snp.center)
            make.trailing.equalTo(view.snp.trailing).offset(-20 * Constraint.xCoeff)
            make.height.equalTo(19 * Constraint.yCoeff)
            make.width.equalTo(60)
        }

        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(upcomingTournamentsTitle.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(183 * Constraint.yCoeff)
        }

        trainingMaterials.snp.remakeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(412 * Constraint.yCoeff)
        }
    }

    @objc private func clickSeeAllButton() {

    }
}

extension MainScreenView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TournamentCell.self),for: indexPath) as? TournamentCell else { return UICollectionViewCell()
        }

        return cell
    }
}
