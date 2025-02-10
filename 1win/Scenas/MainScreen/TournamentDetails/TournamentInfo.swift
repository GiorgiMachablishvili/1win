//
//  TournamentInfo.swift
//  1win
//
//  Created by Gio's Mac on 10.02.25.
//

import UIKit
import SnapKit

class TournamentInfo: UICollectionViewCell {

    private lazy var infoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Information "
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private lazy var dateOfTheEventTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Date of the event:"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textAlignment = .left
        return view
    }()

    lazy var startDateOfTheEvent: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "26.01.2025"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.5)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textAlignment = .left
        return view
    }()

    lazy var endDateOfTheEvent: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "14.02.2025"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.5)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var tournamentVenueTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Tournament venue:"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var tournamentVenue: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "USA"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.5)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var prizeFundTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Prize fund:"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textAlignment = .left
        return view
    }()

    lazy var prizeFund: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "100.000$"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.5)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textAlignment = .left
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
        addSubview(infoLabel)
        addSubview(dateOfTheEventTitle)
        addSubview(startDateOfTheEvent)
        addSubview(endDateOfTheEvent)
        addSubview(tournamentVenueTitle)
        addSubview(tournamentVenue)
        addSubview(prizeFundTitle)
        addSubview(prizeFund)
    }

    private func setupConstraints() {
        infoLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(1 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(1 * Constraint.xCoeff)
            make.height.equalTo(19 * Constraint.yCoeff)
        }

        dateOfTheEventTitle.snp.remakeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(1 * Constraint.xCoeff)
            make.height.equalTo(23 * Constraint.yCoeff)
        }

        startDateOfTheEvent.snp.remakeConstraints { make in
            make.centerY.equalTo(dateOfTheEventTitle.snp.centerY)
            make.trailing.equalTo(endDateOfTheEvent.snp.leading).offset(-1 * Constraint.xCoeff)
            make.height.equalTo(23 * Constraint.yCoeff)
        }

        endDateOfTheEvent.snp.remakeConstraints { make in
            make.centerY.equalTo(dateOfTheEventTitle.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-1 * Constraint.xCoeff)
            make.height.equalTo(23 * Constraint.yCoeff)
        }

        tournamentVenueTitle.snp.remakeConstraints { make in
            make.top.equalTo(dateOfTheEventTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(1 * Constraint.xCoeff)
            make.height.equalTo(23 * Constraint.yCoeff)
        }

        tournamentVenue.snp.remakeConstraints { make in
            make.centerY.equalTo(tournamentVenueTitle.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-1 * Constraint.xCoeff)
            make.height.equalTo(23 * Constraint.yCoeff)
        }

        prizeFundTitle.snp.remakeConstraints { make in
            make.top.equalTo(tournamentVenueTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(1 * Constraint.xCoeff)
            make.height.equalTo(23 * Constraint.yCoeff)
        }

        prizeFund.snp.remakeConstraints { make in
            make.centerY.equalTo(prizeFundTitle.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-1 * Constraint.xCoeff)
            make.height.equalTo(23 * Constraint.yCoeff)
        }
    }
}
