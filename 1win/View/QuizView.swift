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

    private lazy var questionTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Question"
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

    private lazy var quizQuestionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Question"
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraint()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(questionTitle)
        addSubview(closeButton)
        addSubview(quizQuestionLabel)
        addSubview(selectInfoLabel)
    }

    private func setupConstraint() {
        questionTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(24)
        }

        closeButton.snp.remakeConstraints { make in
            make.centerY.equalTo(questionTitle.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-20 * Constraint.xCoeff)
            make.width.height.equalTo(24 * Constraint.yCoeff)
        }

        quizQuestionLabel.snp.remakeConstraints { make in
        
        }
    }

    @objc private func closeButtonPressed() {
        didPressCloseButton?()
    }
}
