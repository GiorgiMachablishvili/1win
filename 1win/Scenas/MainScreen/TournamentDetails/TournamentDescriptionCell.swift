//
//  TournamentDescriptionCell.swift
//  1win
//
//  Created by Gio's Mac on 10.02.25.
//

import UIKit
import SnapKit

class TournamentDescriptionCell: UICollectionViewCell {
    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "backButton"), for: .normal)
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(22)
        view.addTarget(self, action: #selector(pressBackButton), for: .touchUpInside)
        return view
    }()

    private lazy var tournamentDetailsImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "tournamentImage")
        view.contentMode = .scaleToFill
        view.makeRoundCorners(16)
        return view
    }()

    private lazy var tournamentsTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "BLAST Bounty Spring 2025"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private lazy var tournamentsDateTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "BLAST Bounty Spring 2025 is the first LAN tournament of 2025 for Counter-Strike 2. The competition will take place January 23-26 in Copenhagen, Denmark. BLAST Bounty will feature eight teams, each of which won a slot in the qualifying tournament. The prize fund of BLAST Bounty will be $500 thousand. The championship will be held in one stage."
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(tournamentDetailsImage)
        addSubview(backButton)
        addSubview(tournamentsTitle)
        addSubview(tournamentsDateTitle)
    }

    private func setupConstraints() {
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(tournamentDetailsImage.snp.top).offset(44 * Constraint.yCoeff)
            make.leading.equalTo(tournamentDetailsImage.snp.leading).offset(20 * Constraint.xCoeff)
            make.height.width.equalTo(44 * Constraint.yCoeff)
        }

        tournamentDetailsImage.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(259 * Constraint.yCoeff)
        }

        tournamentsTitle.snp.remakeConstraints { make in
            make.top.equalTo(tournamentDetailsImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }

        tournamentsDateTitle.snp.remakeConstraints { make in
            make.top.equalTo(tournamentsTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(8 * Constraint.xCoeff)
            make.height.equalTo(105 * Constraint.yCoeff)
        }


    }

    @objc private func pressBackButton() {

    }

    func configure(with data: TournamentDetailsInfo) {
        tournamentDetailsImage.image = UIImage(named: data.image)
        tournamentsTitle.text = data.title
    }
}
