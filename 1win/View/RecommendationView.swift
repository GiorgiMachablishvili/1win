//
//  RecomendationView.swift
//  1win
//
//  Created by Gio's Mac on 14.02.25.
//

import UIKit
import SnapKit

class RecommendationView: UIView {

    private lazy var recommendationTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Recommendation"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var recommendationBackgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.makeRoundCorners(16)
        view.backgroundColor = .whiteColor.withAlphaComponent(0.25)
        return view
    }()

    lazy var recommendationLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "That's a good result, but you should learn some theory."
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.2)
        view.font = UIFont.goldmanBold(size: 12)
        view.numberOfLines = 2
        view.textAlignment = .left
        return view
    }()

    private lazy var resultPercentageBackgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.makeRoundCorners(16)
        view.backgroundColor = .signInButtonBackgroundColor.withAlphaComponent(0.1)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.signInButtonBackgroundColor.cgColor
        return view
    }()

    private lazy var learningProgressionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Learning progression"
        view.textColor = UIColor(hexString: "#267DFF")
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var learningProgressionInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "You have mastered the material by:"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.2)
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
        return view
    }()

    lazy var percentageLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "95%"
        view.textColor = UIColor(hexString: "#267DFF")
        view.font = UIFont.goldmanBold(size: 24)
        view.textAlignment = .center
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {

        addSubview(recommendationTitle)
        addSubview(recommendationBackgroundView)
        addSubview(recommendationLabel)
        addSubview(resultPercentageBackgroundView)
        addSubview(learningProgressionLabel)
        addSubview(learningProgressionInfoLabel)
        addSubview(percentageLabel)
    }

    private func setupConstraints() {
        recommendationTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(2 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
        }

        recommendationBackgroundView.snp.remakeConstraints { make in
            make.top.equalTo(recommendationTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(62 * Constraint.yCoeff)
        }

        recommendationLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(recommendationBackgroundView)
            make.leading.trailing.equalTo(recommendationBackgroundView).inset(16 * Constraint.xCoeff)
        }

        resultPercentageBackgroundView.snp.remakeConstraints { make in
            make.top.equalTo(recommendationBackgroundView.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(68 * Constraint.yCoeff)
        }

        learningProgressionLabel.snp.remakeConstraints { make in
            make.top.equalTo(resultPercentageBackgroundView.snp.top).offset(16 * Constraint.yCoeff)
            make.leading.equalTo(resultPercentageBackgroundView.snp.leading).offset(16 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }

        learningProgressionInfoLabel.snp.remakeConstraints { make in
            make.top.equalTo(learningProgressionLabel.snp.bottom).offset(4 * Constraint.yCoeff)
            make.leading.equalTo(resultPercentageBackgroundView.snp.leading).offset(16 * Constraint.xCoeff)
            make.height.equalTo(15 * Constraint.yCoeff)
        }

        percentageLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(resultPercentageBackgroundView)
            make.trailing.equalTo(resultPercentageBackgroundView.snp.trailing).offset(-16 * Constraint.xCoeff)
            make.height.equalTo(29 * Constraint.yCoeff)
        }

    }
}
