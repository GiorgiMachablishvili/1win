//
//  TrainingResultCell.swift
//  1win
//
//  Created by Gio's Mac on 16.02.25.
//

import UIKit
import SnapKit

class TrainingResultCell: UICollectionViewCell {
    var didPressBackButton: (() -> Void)?
    var didPressGoToTestingButton: (() -> Void)?

    static let identifier = "TrainingResultCell"

    private lazy var trainingImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "csGoImage")
        view.contentMode = .scaleToFill
        view.makeRoundCorners(32)
        return view
    }()

    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "backButton"), for: .normal)
        view.contentMode = .scaleAspectFit
        view.addTarget(self, action: #selector(pressBackButton), for: .touchUpInside)
        return view
    }()

    private lazy var currentTrainingTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Fast A Split"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 20)
        view.textAlignment = .left
        return view
    }()

    private lazy var trainingPercentageView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .signInButtonBackgroundColor
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var trainingPercentageTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = ""
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .center
        return view
    }()

    private lazy var currentTrainingInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = ""
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.goldmanBold(size: 12)
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()

    private lazy var stepsToExecuteTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Steps to execute:"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private lazy var firstStepLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = ""
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.goldmanBold(size: 12)
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()

    private lazy var advantageTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Advantage:"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private lazy var advantageInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Quick and effective attack from two sides, giving no time for the defense to prepare."
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.goldmanBold(size: 12)
        view.numberOfLines = 0
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

    private lazy var goToTestingButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Go to testing", for: .normal)
        view.backgroundColor = UIColor.signInButtonBackgroundColor
        view.titleLabel?.font = UIFont.goldmanBold(size: 16)
        view.makeRoundCorners(20)
        view.addTarget(self, action: #selector(clickGoToTestingButton), for: .touchUpInside)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .viewBackgroundColor
        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(trainingImage)
        addSubview(backButton)
        addSubview(currentTrainingTitle)
        addSubview(trainingPercentageView)
        addSubview(trainingPercentageTitle)
        addSubview(currentTrainingInfoLabel)
        addSubview(stepsToExecuteTitle)
        addSubview(firstStepLabel)
        addSubview(advantageTitle)
        addSubview(advantageInfoLabel)
        addSubview(goToTestingButton)
        addSubview(resultPercentageBackgroundView)
        addSubview(learningProgressionLabel)
        addSubview(learningProgressionInfoLabel)
        addSubview(percentageLabel)
    }

    private func setupConstraints() {
        trainingImage.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(259 * Constraint.yCoeff)
        }

        backButton.snp.remakeConstraints { make in
            make.top.equalTo(trainingImage.snp.top).offset(44 * Constraint.yCoeff)
            make.leading.equalTo(trainingImage.snp.leading).offset(20 * Constraint.xCoeff)
            make.height.width.equalTo(44 * Constraint.yCoeff)
        }

        currentTrainingTitle.snp.remakeConstraints { make in
            make.top.equalTo(trainingImage.snp.bottom).offset(32 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }

        trainingPercentageView.snp.remakeConstraints { make in
            make.centerY.equalTo(currentTrainingTitle)
            make.trailing.equalTo(snp.trailing).offset(-20 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
            make.width.equalTo(48 * Constraint.xCoeff)
        }

        trainingPercentageTitle.snp.remakeConstraints { make in
            make.center.equalTo(trainingPercentageView)
            make.height.equalTo(14 * Constraint.yCoeff)
        }

        currentTrainingInfoLabel.snp.remakeConstraints { make in
            make.top.equalTo(currentTrainingTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.lessThanOrEqualTo(187 * Constraint.yCoeff)
        }

        stepsToExecuteTitle.snp.remakeConstraints { make in
            make.top.equalTo(currentTrainingInfoLabel.snp.bottom).offset(32 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(19 * Constraint.yCoeff)
        }

        firstStepLabel.snp.remakeConstraints { make in
            make.top.equalTo(stepsToExecuteTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
        }

        advantageTitle.snp.remakeConstraints { make in
            make.top.equalTo(firstStepLabel.snp.bottom).offset(32 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(19 * Constraint.yCoeff)
        }

        advantageInfoLabel.snp.remakeConstraints { make in
            make.top.equalTo(advantageTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
        }

        resultPercentageBackgroundView.snp.remakeConstraints { make in
            make.top.equalTo(advantageInfoLabel.snp.bottom).offset(32 * Constraint.yCoeff)
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

        goToTestingButton.snp.remakeConstraints { make in
            make.top.equalTo(resultPercentageBackgroundView.snp.bottom).offset(19 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(60 * Constraint.yCoeff)
        }
    }

    @objc private func pressBackButton() {
        didPressBackButton?()
    }

    @objc private func clickGoToTestingButton() {
        didPressGoToTestingButton?()
    }

    func configure(with data: TrainingModel, percentage: String) {
        trainingImage.image = UIImage(named: data.image)
        currentTrainingTitle.text = data.title
        currentTrainingInfoLabel.text = data.description
        firstStepLabel.text = data.steps
        advantageInfoLabel.text = data.advantage
        percentageLabel.text = percentage
        trainingPercentageTitle.text = percentage
    }
}
