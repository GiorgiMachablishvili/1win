//
//  MainScreenView.swift
//  1win
//
//  Created by Gio's Mac on 08.02.25.
//

import UIKit
import SnapKit

class MainScreenController: UIViewController {

    private let tournamentsData: [TournamentDetailsInfo] = [
        TournamentDetailsInfo(image: "tournamentImage", title: "BLAST Bounty Spring 2025", startEvent: "26.01.2025", endEvent: "14.02.2025", prizePrice: "$100,000", tournamentVenue: "USA"),
        TournamentDetailsInfo(image: "tournamentImage", title: "DreamHack Masters 2025", startEvent: "10.03.2025", endEvent: "22.03.2025", prizePrice: "$150,000", tournamentVenue: "Germany")
    ]

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
        view.didPressCSButton = { [weak self] gameType in
            self?.moveToGameView(gameType: gameType)
        }
        view.didPressDotaButton = { [weak self] gameType in
            self?.moveToGameView(gameType: gameType)
        }
        view.didPressLOLButton = { [weak self] gameType in
            self?.moveToGameView(gameType: gameType)
        }
        view.didPressValorantButton = { [weak self] gameType in
            self?.moveToGameView(gameType: gameType)
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
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

    private func moveToGameView(gameType: String) {
        let gameVC = GameController(gameType: gameType)
        gameVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(gameVC, animated: true)
    }

    @objc private func clickSeeAllButton() {

    }
}

extension MainScreenController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tournamentsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TournamentCell.self),for: indexPath) as? TournamentCell else { return UICollectionViewCell()
        }
        let tournament = tournamentsData[indexPath.item]
        cell.configure(with: tournament)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTournament = tournamentsData[indexPath.item]
        let detailsView = TournamentDetailsView()
        detailsView.hidesBottomBarWhenPushed = true
//        detailsView.configure(with: selectedTournament)
        navigationController?.pushViewController(detailsView, animated: true)
    }
}
