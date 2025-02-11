//
//  TournamentParticipantsCell.swift
//  1win
//
//  Created by Gio's Mac on 10.02.25.
//

import UIKit
import SnapKit

class TournamentParticipantsCell: UICollectionViewCell {

    var didPressVoteButton: (() -> Void)?

    private lazy var participantsTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Tournament participants "
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private let teams: [TournamentTeam] = [
            TournamentTeam(imageName: "navi", title: "Navi"),
            TournamentTeam(imageName: "spirit", title: "Spirit"),
            TournamentTeam(imageName: "G2", title: "G2"),
            TournamentTeam(imageName: "vitality", title: "Vitality"),
            TournamentTeam(imageName: "betBoom", title: "BetBoom"),
            TournamentTeam(imageName: "ef", title: "EF"),
            TournamentTeam(imageName: "heroic", title: "Heroic"),
            TournamentTeam(imageName: "pianN", title: "PianN")
        ]

    private var teamViews: [AttributedStringView] = []


    private lazy var voteButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("VOTE", for: .normal)
        view.backgroundColor = UIColor.signInButtonBackgroundColor
        view.titleLabel?.font = UIFont.goldmanBold(size: 16)
        view.makeRoundCorners(20)
        view.addTarget(self, action: #selector(clickVoteButton), for: .touchUpInside)
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
        addSubview(participantsTitle)
        for team in teams {
            let teamView = AttributedStringView(leftImage: UIImage(named: team.imageName), text: team.title, text2: "\(0/*Int.random(in: 10...50)*/)%")
            teamViews.append(teamView)
            addSubview(teamView)
        }
        addSubview(voteButton)
    }

    private func setupConstraints() {
        participantsTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.height.equalTo(19)
        }

        var previousView: UIView = participantsTitle
        for teamView in teamViews {
            teamView.snp.makeConstraints { make in
                make.top.equalTo(previousView.snp.bottom).offset(8 * Constraint.yCoeff)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(40)
            }
            previousView = teamView
        }

        voteButton.snp.remakeConstraints { make in
//            make.bottom.equalTo(snp.bottom)
            make.top.equalTo(previousView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(60 * Constraint.yCoeff)
        }
    }

    @objc private func clickVoteButton() {
        didPressVoteButton?()
    }
}
