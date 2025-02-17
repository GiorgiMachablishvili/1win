//
//  AchievementsCell.swift
//  1win
//
//  Created by Gio's Mac on 17.02.25.
//

import UIKit
import SnapKit

class AchievementsCell: UICollectionViewCell {

    var didSelectAchievement: ((String, String, String) -> Void)?

    private lazy var achievementsLabel: UILabel = {
        let view = UILabel()
        view.text = "Achievements"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var firstStepImage: UIButton = createAchievementButton(imageName: "firstStep", title: "First Step", description: "Complete your first lesson")
    private lazy var grandmasterApprenticeImage: UIButton = createAchievementButton(imageName: "grandmasterApprentice", title: "Grandmaster Apprentice", description: "Complete 10 lessons")
    private lazy var goldenBrainImage: UIButton = createAchievementButton(imageName: "goldenBrain", title: "Golden Brain", description: "Complete 5 lessons 100% the first time.")
    private lazy var cyberAcademicImage: UIButton = createAchievementButton(imageName: "cyberAcademic", title: "Cyber Academic", description: "Complete 20 lessons")
    private lazy var fearlessLearnerImage: UIButton = createAchievementButton(imageName: "fearlessLearner", title: "Fearless Learner", description: "Pass 3 tests in a row without mistakes.")
    private lazy var voiceOfCyberSportsImage: UIButton = createAchievementButton(imageName: "voiceOfCybersports", title: "Voice of Cybersports", description: "Vote for the team 10 times")
    private lazy var marathonerImage: UIButton = createAchievementButton(imageName: "marathoner", title: "Marathoner", description: "Complete 5 lessons in one day.")

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
        addSubview(achievementsLabel)
        addSubview(firstStepImage)
        addSubview(grandmasterApprenticeImage)
        addSubview(goldenBrainImage)
        addSubview(cyberAcademicImage)
        addSubview(fearlessLearnerImage)
        addSubview(voiceOfCyberSportsImage)
        addSubview(marathonerImage)
    }

    private func setupConstraints() {
        achievementsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(15 * Constraint.yCoeff)
        }

        let buttons = [firstStepImage, grandmasterApprenticeImage, goldenBrainImage, cyberAcademicImage, fearlessLearnerImage, voiceOfCyberSportsImage, marathonerImage]

        for (index, button) in buttons.enumerated() {
            button.snp.makeConstraints { make in
                make.top.equalTo(achievementsLabel.snp.bottom).offset(8 * Constraint.yCoeff)
                make.leading.equalToSuperview().offset(CGFloat(index) * (50 * Constraint.xCoeff))
                make.height.width.equalTo(45 * Constraint.yCoeff)
            }
        }
    }

    private func createAchievementButton(imageName: String, title: String, description: String) -> UIButton {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: imageName), for: .normal)
        view.contentMode = .scaleAspectFit
        view.accessibilityLabel = title
        view.accessibilityHint = description
        view.tag = imageName.hashValue

        view.addTarget(self, action: #selector(achievementButtonTapped(_:)), for: .touchUpInside)
        return view
    }

    @objc private func achievementButtonTapped(_ sender: UIButton) {
        guard let title = sender.accessibilityLabel, let description = sender.accessibilityHint else { return }

        let imageName: String
        switch title {
            case "First Step": imageName = "firstStep"
            case "Grandmaster Apprentice": imageName = "grandmasterApprentice"
            case "Golden Brain": imageName = "goldenBrain"
            case "Cyber Academic": imageName = "cyberAcademic"
            case "Fearless Learner": imageName = "fearlessLearner"
            case "Voice of Cybersports": imageName = "voiceOfCybersports"
            case "Marathoner": imageName = "marathoner"
            default: return
        }

        didSelectAchievement?(title, imageName, description)
    }
}


//import UIKit
//import SnapKit
//
//class AchievementsCell: UICollectionViewCell {
//
//    private lazy var achievementsLabel: UILabel = {
//        let view = UILabel(frame: .zero)
//        view.text = "Achievements"
//        view.textColor = UIColor.whiteColor
//        view.font = UIFont.goldmanBold(size: 12)
//        view.textAlignment = .left
//        return view
//    }()
//
//    private lazy var firstStepImage: UIButton = {
//        let view = UIButton(frame: .zero)
//        view.setImage(UIImage(named: "firstStep"), for: .normal)
//        view.contentMode = .scaleToFill
//        return view
//    }()
//
//    private lazy var grandmasterApprenticeImage: UIButton = {
//        let view = UIButton(frame: .zero)
//        view.setImage(UIImage(named: "grandmasterApprentice"), for: .normal)
//        view.contentMode = .scaleToFill
//        return view
//    }()
//
//    private lazy var goldenBrainImage: UIButton = {
//        let view = UIButton(frame: .zero)
//        view.setImage(UIImage(named: "goldenBrain"), for: .normal)
//        view.contentMode = .scaleToFill
//        return view
//    }()
//
//    private lazy var cyberAcademicImage: UIButton = {
//        let view = UIButton(frame: .zero)
//        view.setImage(UIImage(named: "cyberAcademic"), for: .normal)
//        view.contentMode = .scaleToFill
//        return view
//    }()
//
//    private lazy var fearlessLearnerImage: UIButton = {
//        let view = UIButton(frame: .zero)
//        view.setImage(UIImage(named: "fearlessLearner"), for: .normal)
//        view.contentMode = .scaleToFill
//        return view
//    }()
//
//    private lazy var voiceOfCyberSportsImage: UIButton = {
//        let view = UIButton(frame: .zero)
//        view.setImage(UIImage(named: "voiceOfCybersports"), for: .normal)
//        view.contentMode = .scaleToFill
//        return view
//    }()
//
//    private lazy var marathonerImage: UIButton = {
//        let view = UIButton(frame: .zero)
//        view.setImage(UIImage(named: "marathoner"), for: .normal)
//        view.contentMode = .scaleToFill
//        return view
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .clear
//        setup()
//        setupConstraints()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setup() {
//        addSubview(achievementsLabel)
//        addSubview(firstStepImage)
//        addSubview(grandmasterApprenticeImage)
//        addSubview(goldenBrainImage)
//        addSubview(cyberAcademicImage)
//        addSubview(fearlessLearnerImage)
//        addSubview(voiceOfCyberSportsImage)
//        addSubview(marathonerImage)
//    }
//
//    private func setupConstraints() {
//        achievementsLabel.snp.remakeConstraints { make in
//            make.top.equalTo(snp.top)
//            make.leading.equalTo(snp.leading)
//            make.height.equalTo(15 * Constraint.yCoeff)
//        }
//
//        firstStepImage.snp.remakeConstraints { make in
//            make.top.equalTo(achievementsLabel.snp.bottom).offset(8 * Constraint.yCoeff)
//            make.leading.equalTo(snp.leading)
//            make.height.width.equalTo(45 * Constraint.yCoeff)
//        }
//
//        grandmasterApprenticeImage.snp.remakeConstraints { make in
//            make.centerY.equalTo(firstStepImage)
//            make.leading.equalTo(firstStepImage.snp.trailing).offset(5 * Constraint.xCoeff)
//            make.height.width.equalTo(45 * Constraint.yCoeff)
//        }
//
//        goldenBrainImage.snp.remakeConstraints { make in
//            make.centerY.equalTo(firstStepImage)
//            make.leading.equalTo(grandmasterApprenticeImage.snp.trailing).offset(5 * Constraint.xCoeff)
//            make.height.width.equalTo(45 * Constraint.yCoeff)
//        }
//
//        cyberAcademicImage.snp.remakeConstraints { make in
//            make.centerY.equalTo(firstStepImage)
//            make.leading.equalTo(goldenBrainImage.snp.trailing).offset(5 * Constraint.xCoeff)
//            make.height.width.equalTo(45 * Constraint.yCoeff)
//        }
//
//        fearlessLearnerImage.snp.remakeConstraints { make in
//            make.centerY.equalTo(firstStepImage)
//            make.leading.equalTo(cyberAcademicImage.snp.trailing).offset(5 * Constraint.xCoeff)
//            make.height.width.equalTo(45 * Constraint.yCoeff)
//        }
//
//        voiceOfCyberSportsImage.snp.remakeConstraints { make in
//            make.centerY.equalTo(firstStepImage)
//            make.leading.equalTo(fearlessLearnerImage.snp.trailing).offset(5 * Constraint.xCoeff)
//            make.height.width.equalTo(45 * Constraint.yCoeff)
//        }
//
//        marathonerImage.snp.remakeConstraints { make in
//            make.centerY.equalTo(firstStepImage)
//            make.leading.equalTo(voiceOfCyberSportsImage.snp.trailing).offset(5 * Constraint.xCoeff)
//            make.height.width.equalTo(45 * Constraint.yCoeff)
//        }
//    }
//
//}
