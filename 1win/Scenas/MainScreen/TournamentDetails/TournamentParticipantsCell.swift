//
//  TournamentParticipantsCell.swift
//  1win
//
//  Created by Gio's Mac on 10.02.25.
//

import UIKit
import SnapKit

class TournamentParticipantsCell: UICollectionViewCell {
    private lazy var participantsTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Tournament participants "
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private lazy var naviRating = AttributedStringView(
           leftImage: UIImage(named: "navi"),
           text: "Navi",
           text2: "25%"
       )

    private lazy var spiritRating = AttributedStringView(
           leftImage: UIImage(named: "spirit"),
           text: "Spirit",
           text2: "20%"
       )

    private lazy var g2Rating = AttributedStringView(
           leftImage: UIImage(named: "G2"),
           text: "G@",
           text2: "15%"
       )



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
        addSubview(naviRating)
        addSubview(spiritRating)
        addSubview(g2Rating)
        addSubview(voteButton)
    }

    private func setupConstraints() {
        participantsTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.height.equalTo(19)
        }

        naviRating.snp.remakeConstraints { make in
            make.top.equalTo(participantsTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }

        spiritRating.snp.remakeConstraints { make in
            make.top.equalTo(naviRating.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }

        g2Rating.snp.remakeConstraints { make in
            make.top.equalTo(spiritRating.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }

        voteButton.snp.remakeConstraints { make in
            make.bottom.equalTo(snp.bottom).offset(100 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(60 * Constraint.yCoeff)
        }
    }

    @objc private func clickVoteButton() {

    }
}
