//
//  TournamentCell.swift
//  1win
//
//  Created by Gio's Mac on 09.02.25.
//

import UIKit
import SnapKit
import Kingfisher

class TournamentCell: UICollectionViewCell {

    var prizePriceString = "100.000"

    private lazy var tournamentImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "tournamentImage")
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(16)
        return view
    }()

    private var tournamentInfoBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.1)
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
        view.text = "Date of the event:"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var tournamentsStartDate: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "26.01.2025"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.6)
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var tournamentsEndDate: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "14.02.2025"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.6)
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var liveButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "liveImage"), for: .normal)
        view.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.15)
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(clickLiveButton), for: .touchUpInside)
        return view
    }()

    private lazy var goButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "goImage"), for: .normal)
        view.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.15)
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(clickLiveButton), for: .touchUpInside)
        return view
    }()

    private lazy var prizePriceView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "#267DFF").withAlphaComponent(0.1)
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var prizePriceImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "prize")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var prizePriceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "100 000"
        view.textColor = UIColor(hexString: "#267DFF")
        view.font = UIFont.goldmanBold(size: 10)
        view.textAlignment = .center
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
        addSubview(tournamentImage)
        addSubview(tournamentInfoBackground)
        tournamentInfoBackground.addSubview(tournamentsTitle)
        tournamentInfoBackground.addSubview(tournamentsDateTitle)
        tournamentInfoBackground.addSubview(tournamentsStartDate)
        tournamentInfoBackground.addSubview(tournamentsEndDate)
        tournamentInfoBackground.addSubview(liveButton)
        tournamentInfoBackground.addSubview(goButton)
        tournamentInfoBackground.addSubview(prizePriceView)
        prizePriceView.addSubview(prizePriceImage)
        prizePriceView.addSubview(prizePriceLabel)
    }

    private func setupConstraints() {
        tournamentImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(5 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(76 * Constraint.yCoeff)
        }

        tournamentInfoBackground.snp.remakeConstraints { make in
            make.top.equalTo(tournamentImage.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(107 * Constraint.yCoeff)
        }

        tournamentsTitle.snp.remakeConstraints { make in
            make.top.equalTo(tournamentInfoBackground.snp.top).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(tournamentInfoBackground.snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }

        tournamentsDateTitle.snp.remakeConstraints { make in
            make.top.equalTo(tournamentsTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(tournamentsTitle.snp.leading)
            make.height.equalTo(16 * Constraint.yCoeff)
        }

        tournamentsStartDate.snp.remakeConstraints { make in
            make.centerY.equalTo(tournamentsDateTitle.snp.centerY)
            make.leading.equalTo(tournamentsDateTitle.snp.trailing).offset(8 * Constraint.xCoeff)
            make.height.equalTo(16 * Constraint.yCoeff)
        }

        tournamentsEndDate.snp.remakeConstraints { make in
            make.centerY.equalTo(tournamentsDateTitle.snp.centerY)
            make.leading.equalTo(tournamentsStartDate.snp.trailing).offset(13 * Constraint.xCoeff)
            make.height.equalTo(16 * Constraint.yCoeff)
        }

        liveButton.snp.remakeConstraints { make in
            make.top.equalTo(tournamentsDateTitle.snp.bottom).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(tournamentsDateTitle.snp.leading)
            make.height.equalTo(28 * Constraint.yCoeff)
            make.width.equalTo(62 * Constraint.yCoeff)
        }

        goButton.snp.remakeConstraints { make in
            make.top.equalTo(tournamentsDateTitle.snp.bottom).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(liveButton.snp.trailing).offset(4 * Constraint.xCoeff)
            make.height.equalTo(28 * Constraint.yCoeff)
            make.width.equalTo(44 * Constraint.yCoeff)
        }

        prizePriceView.snp.remakeConstraints { make in
            make.centerY.equalTo(goButton.snp.centerY)
            make.leading.equalTo(goButton.snp.trailing).offset(4 * Constraint.xCoeff)
            make.height.equalTo(28)
            make.width.equalTo(96)
        }

        prizePriceImage.snp.remakeConstraints { make in
            make.centerY.equalTo(prizePriceView.snp.centerY)
            make.leading.equalTo(prizePriceView.snp.leading).offset(12 * Constraint.xCoeff)
            make.height.width.equalTo(16 * Constraint.xCoeff)
        }

        prizePriceLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(prizePriceView.snp.centerY)
            make.leading.equalTo(prizePriceImage.snp.trailing).offset(4 * Constraint.xCoeff)
            make.height.equalTo(12 * Constraint.xCoeff)
        }
    }

    @objc private func clickLiveButton() {

    }

    func configure(with data: TournamentDetailsInfo) {
        tournamentsTitle.text = data.title
        tournamentsStartDate.text = data.startEvent
        tournamentsEndDate.text = data.endEvent
        prizePriceLabel.text = data.prizePrice
        tournamentImage.image = UIImage(named: data.image)
    }
}
