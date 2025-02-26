//
//  QuizView.swift
//  1win
//
//  Created by Gio's Mac on 13.02.25.
//

import UIKit
import SnapKit

class QuizView: UIView {

    var didPressCloseButton: (() -> Void)?
    var didFinishQuiz: ((Int, Int) -> Void)?

    var questions: [QuizQuestion] = []
    private var currentQuestionIndex = 0
    private var score = 0
    private var selectedAnswer: UIButton?

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

    private lazy var questionTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Question"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private lazy var questionIndicatorStack: UIStackView = {
           let stack = UIStackView()
           stack.axis = .horizontal
           stack.alignment = .center
           stack.spacing = 6
           return stack
       }()

    private lazy var closeButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "close"), for: .normal)
        view.tintColor = UIColor.white.withAlphaComponent(0.4)
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return view
    }()

    private lazy var quizQuestionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 24)
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()

    private lazy var selectInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Select an answer choice"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.goldmanBold(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var answerButtons: [UIButton] = (0..<4).map { _ in
        let view = UIButton(type: .system)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.makeRoundCorners(12)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 12)
        view.titleLabel?.numberOfLines = 0
        view.addTarget(self, action: #selector(answerSelected(_:)), for: .touchUpInside)
        return view
    }

    private lazy var nextButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Next", for: .normal)
        view.setTitleColor(.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanBold(size: 16)
        view.backgroundColor = .signInButtonBackgroundColor.withAlphaComponent(0.2)
        view.makeRoundCorners(12)
        view.isUserInteractionEnabled = false
        view.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
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
        addSubview(questionTitle)
        addSubview(questionIndicatorStack)
        addSubview(closeButton)
        addSubview(quizQuestionLabel)
        addSubview(selectInfoLabel)
        addSubview(nextButton)

        for button in answerButtons {
            addSubview(button)
        }
    }

    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        quizBackgroundView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(477 * Constraint.yCoeff)
        }

        questionTitle.snp.makeConstraints { make in
            make.top.equalTo(quizBackgroundView.snp.top).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(quizBackgroundView.snp.leading).offset(20 * Constraint.xCoeff)
        }

        questionIndicatorStack.snp.makeConstraints { make in
            make.centerY.equalTo(questionTitle)
            make.centerX.equalTo(quizBackgroundView)
        }

        closeButton.snp.makeConstraints { make in
            make.centerY.equalTo(questionTitle.snp.centerY)
            make.trailing.equalTo(quizBackgroundView.snp.trailing).offset(-20 * Constraint.xCoeff)
            make.width.height.equalTo(24 * Constraint.yCoeff)
        }

        quizQuestionLabel.snp.makeConstraints { make in
            make.top.equalTo(questionTitle.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
        }

        selectInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(quizQuestionLabel.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.equalTo(quizBackgroundView.snp.leading).offset(20 * Constraint.xCoeff)
        }

        let buttonSpacing: CGFloat = 8 * Constraint.yCoeff
        for (index, button) in answerButtons.enumerated() {
            let row = index / 2
            let column = index % 2

            button.snp.makeConstraints { make in
                make.top.equalTo(selectInfoLabel.snp.bottom).offset(CGFloat(88 * row) * Constraint.yCoeff + buttonSpacing * CGFloat(row))
                make.width.equalTo(171 * Constraint.xCoeff)
                make.height.equalTo(80 * Constraint.yCoeff)
                if column == 0 {
                    make.leading.equalToSuperview().offset(20 * Constraint.xCoeff)
                } else {
                    make.trailing.equalToSuperview().offset(-20 * Constraint.xCoeff)
                }
            }
        }

        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(snp.bottom).offset(-44 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(60 * Constraint.yCoeff)
        }
    }

    func configure(with questions: [QuizQuestion]) {
            self.questions = questions
            currentQuestionIndex = 0
            score = 0
            setupQuestionIndicators()
            updateQuestionIndicator()
            showQuestion()
        }

        private func setupQuestionIndicators() {
            questionIndicatorStack.arrangedSubviews.forEach { $0.removeFromSuperview() }

            for _ in 0..<questions.count {
                let dot = UIView()
                dot.backgroundColor = UIColor.white.withAlphaComponent(0.3)
                dot.makeRoundCorners(2)
                dot.snp.makeConstraints { make in
                    make.width.height.equalTo(4)
                }
                questionIndicatorStack.addArrangedSubview(dot)
            }
        }

        private func updateQuestionIndicator() {
            for (index, dot) in questionIndicatorStack.arrangedSubviews.enumerated() {
                dot.backgroundColor = index == currentQuestionIndex ? .signInButtonBackgroundColor : UIColor.white.withAlphaComponent(0.3)
            }
        }

    private func showQuestion() {
        guard currentQuestionIndex < questions.count else {
            showFinalScore()
            return
        }

        let question = questions[currentQuestionIndex]
        quizQuestionLabel.text = question.question

        for (index, option) in question.options.enumerated() {
            answerButtons[index].setTitle(option, for: .normal)
            answerButtons[index].backgroundColor = UIColor.whiteColor.withAlphaComponent(0.3)
            answerButtons[index].isUserInteractionEnabled = true
        }

        selectedAnswer = nil
        nextButton.isUserInteractionEnabled = false
        nextButton.backgroundColor = .signInButtonBackgroundColor.withAlphaComponent(0.2)
    }

    @objc private func answerSelected(_ sender: UIButton) {
        guard let answerText = sender.currentTitle else { return }

        for button in answerButtons {
            button.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.3)
        }
        sender.backgroundColor = .blue
        selectedAnswer = sender

        nextButton.isUserInteractionEnabled = true
        nextButton.backgroundColor = .signInButtonBackgroundColor
    }

    @objc private func nextButtonPressed() {
        guard let selectedAnswer = selectedAnswer, let answerText = selectedAnswer.currentTitle else { return }

        let question = questions[currentQuestionIndex]
        if answerText == question.correctAnswer {
            score += 1
        }
        //TODO: press next button should move currentQuestionIndex point
        currentQuestionIndex += 1
        showQuestion()
    }

    private func showFinalScore() {
        didFinishQuiz?(score, questions.count)
    }

    //TODO: press close button and enter again should show new questions
    @objc private func closeButtonPressed() {
//        resetQuiz()
        didPressCloseButton?()
    }
//
//    private func resetQuiz() {
//        questions.shuffle()
//        currentQuestionIndex = 0
//        score = 0
//        setupQuestionIndicators()
//        updateQuestionIndicator()
//        showQuestion()
//    }
}
