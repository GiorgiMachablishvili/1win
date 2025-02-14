//
//  QuizResultView.swift
//  1win
//
//  Created by Gio's Mac on 14.02.25.
//

import UIKit
import SnapKit

class QuizResultView: UIView {

    var didPressCloseButton: (() -> Void)?

    private lazy var backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear.withAlphaComponent(0.7)
        return view
    }()

    private lazy var quizBackgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.makeRoundCorners(32)
        view.backgroundColor = .viewBackgroundColor
        return view
    }()

    private lazy var resultsTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Results"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private lazy var closeButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "close"), for: .normal)
        view.tintColor = UIColor.white.withAlphaComponent(0.4)
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return view
    }()

    private lazy var yourAnswersTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Your answers"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    lazy var quizResultLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()

    private lazy var incorrectAnswerImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "incorrectAnswer")
        view.contentMode = .scaleToFill
        view.makeRoundCorners(20)
        return view
    }()

    private lazy var correctAnswerImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "correctAnswer")
        view.contentMode = .scaleToFill
        view.makeRoundCorners(20)
        view.isHidden = true
        return view
    }()

    private lazy var recommendationView: RecommendationView = {
        let view = RecommendationView()
        view.backgroundColor = .clear
        return view
    }()

    private lazy var completeButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Complete", for: .normal)
        view.setTitleColor(.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanBold(size: 16)
        view.backgroundColor = .signInButtonBackgroundColor
        view.makeRoundCorners(12)
        view.isUserInteractionEnabled = false
        view.addTarget(self, action: #selector(completeButtonPressed), for: .touchUpInside)
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
        addSubview(backgroundView)
        addSubview(quizBackgroundView)
        addSubview(resultsTitle)
        addSubview(closeButton)
        addSubview(yourAnswersTitle)
        addSubview(quizResultLabel)
        addSubview(incorrectAnswerImage)
        addSubview(correctAnswerImage)
        addSubview(recommendationView)
        addSubview(completeButton)
    }

    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        quizBackgroundView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(477 * Constraint.yCoeff)
        }

        resultsTitle.snp.makeConstraints { make in
            make.top.equalTo(quizBackgroundView.snp.top).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(quizBackgroundView.snp.leading).offset(20 * Constraint.xCoeff)
        }

        closeButton.snp.makeConstraints { make in
            make.centerY.equalTo(resultsTitle.snp.centerY)
            make.trailing.equalTo(quizBackgroundView.snp.trailing).offset(-20 * Constraint.xCoeff)
            make.width.height.equalTo(24 * Constraint.yCoeff)
        }

        yourAnswersTitle.snp.remakeConstraints { make in
            make.top.equalTo(resultsTitle.snp.bottom).offset(32 * Constraint.yCoeff)
            make.leading.equalTo(quizBackgroundView.snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }

        quizResultLabel.snp.remakeConstraints { make in
            make.top.equalTo(yourAnswersTitle.snp.bottom).offset(4 * Constraint.yCoeff)
            make.leading.equalTo(quizBackgroundView.snp.leading).offset(20 * Constraint.xCoeff)
        }

        incorrectAnswerImage.snp.remakeConstraints { make in
            make.top.equalTo(quizResultLabel.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(quizBackgroundView.snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(44 * Constraint.xCoeff)
            make.width.equalTo(65 * Constraint.yCoeff)
        }

        correctAnswerImage.snp.remakeConstraints { make in
            make.top.equalTo(quizResultLabel.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(quizBackgroundView.snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(44 * Constraint.xCoeff)
            make.width.equalTo(65 * Constraint.yCoeff)
        }

        recommendationView.snp.remakeConstraints { make in
            make.bottom.equalTo(completeButton.snp.top).offset(-32 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(163)
        }

        completeButton.snp.remakeConstraints { make in
            make.bottom.equalTo(snp.bottom).offset(-44 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(60 * Constraint.yCoeff)
        }

    }

    func createExpAttributedString(correctAnswers: Int, totalQuestions: Int) -> NSAttributedString {
        let baseText = "You answered \(correctAnswers) out of \(totalQuestions) questions correctly"

        let baseAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.goldmanRegular(size: 14),
            .foregroundColor: UIColor.whiteColor.withAlphaComponent(0.8)
        ]

        let highlightAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.goldmanBold(size: 16),
            .foregroundColor: UIColor.green
        ]

        let attributedString = NSMutableAttributedString(string: baseText, attributes: baseAttributes)

        // Find and apply highlight styling to the correct answers count
        let range = (baseText as NSString).range(of: "\(correctAnswers)")
        attributedString.addAttributes(highlightAttributes, range: range)

        return attributedString
    }

    /// Function to update the result label with a dynamic correct answer count
//    func updateResult(correctAnswers: Int, totalQuestions: Int) {
//        let percentage = (correctAnswers * 100) / totalQuestions
//        recommendationView.percentageLabel.text = "\(percentage)%"
//        
//        quizResultLabel.attributedText = createExpAttributedString(correctAnswers: correctAnswers, totalQuestions: totalQuestions)
//    }

    func updateResult(correctAnswers: Int, totalQuestions: Int) {
        let percentage = (correctAnswers * 100) / totalQuestions
        recommendationView.percentageLabel.text = "\(percentage)%"

        quizResultLabel.attributedText = createExpAttributedString(correctAnswers: correctAnswers, totalQuestions: totalQuestions)

        // Remove previous answer images if any
        incorrectAnswerImage.removeFromSuperview()
        correctAnswerImage.removeFromSuperview()

        // Container for images
        let imageStackView = UIStackView()
        imageStackView.axis = .horizontal
        imageStackView.spacing = 6
        imageStackView.alignment = .center
        imageStackView.distribution = .equalSpacing
        quizBackgroundView.addSubview(imageStackView)

        // Constraints for the stack view
        imageStackView.snp.makeConstraints { make in
            make.top.equalTo(quizResultLabel.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(quizBackgroundView.snp.leading).offset(20 * Constraint.xCoeff)
        }

        // Add images dynamically
        for index in 0..<totalQuestions {
            let imageView = UIImageView()
            imageView.snp.makeConstraints { make in
                make.width.equalTo(65)
                make.height.equalTo(44)
            }

//            if index < correctAnswers {
//                imageView.image = UIImage(named: "correctAnswer") // Show correct answer images first
//            } else {
//                imageView.image = UIImage(named: "incorrectAnswer") // Show incorrect answer images
//            }

            if correctAnswers > 0 && index < correctAnswers {
                imageView.image = UIImage(named: "correctAnswer")
            } else {
                imageView.image = UIImage(named: "incorrectAnswer")
            }

            imageStackView.addArrangedSubview(imageView)
        }
    }


    @objc private func closeButtonPressed() {
        didPressCloseButton?()
    }

    @objc private func completeButtonPressed() {

    }
}
