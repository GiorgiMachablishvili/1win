//
//  TrainingCell.swift
//  1win
//
//  Created by Gio's Mac on 12.02.25.
//

import UIKit
import SnapKit

class TrainingCell: UICollectionViewCell {
    private lazy var popularTrainingTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Popular training"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 20)
        view.textAlignment = .left
        return view
    }()

    private var trainingInfoBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.1)
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var tournamentImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "tournamentImage")
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(16)
        return view
    }()

    private lazy var fastASplitTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Fast A Split"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var fastASplitInfo: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Dust2, Attack on A, Fast Separation, Flashes and Smokejumpers"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.numberOfLines = 0
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
        addSubview(popularTrainingTitle)
        addSubview(trainingInfoBackground)
        trainingInfoBackground.addSubview(tournamentImage)
        trainingInfoBackground.addSubview(fastASplitTitle)
        trainingInfoBackground.addSubview(fastASplitInfo)
    }

    private func setupConstraints() {
        popularTrainingTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(16 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }

        trainingInfoBackground.snp.remakeConstraints { make in
            make.top.equalTo(popularTrainingTitle.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(154 * Constraint.yCoeff)
            make.width.equalTo(320 * Constraint.xCoeff)
        }

        tournamentImage.snp.remakeConstraints { make in
            make.top.equalTo(trainingInfoBackground.snp.top).offset(12 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(76 * Constraint.yCoeff)
        }

        fastASplitTitle.snp.remakeConstraints { make in
            make.top.equalTo(tournamentImage.snp.bottom).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(trainingInfoBackground.snp.leading).offset(12 * Constraint.xCoeff)
            make.height.equalTo(14 * Constraint.yCoeff)
        }

        fastASplitInfo.snp.remakeConstraints { make in
            make.top.equalTo(fastASplitTitle.snp.bottom).offset(4 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(12 * Constraint.xCoeff)
        }
    }
}
