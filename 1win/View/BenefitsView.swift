//
//  BenefitsView.swift
//  1win
//
//  Created by Gio's Mac on 08.02.25.
//

import UIKit
import SnapKit

class BenefitsView: UIView {
    private lazy var benefitTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Benefits:"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
        return view
    }()

    lazy var accountImageLabel: CustomLabelView = {
        let view = CustomLabelView(
            leftImage: UIImage(named: "apple"),
            middleText: "Access your account on all devices"
        )
        return view
    }()

    lazy var savingLessonsLabel: CustomLabelView = {
        let view = CustomLabelView(
            leftImage: UIImage(named: "lessoons"),
            middleText: "Saving lessons and tests taken"
        )
        return view
    }()

    lazy var securityLabel: CustomLabelView = {
        let view = CustomLabelView(
            leftImage: UIImage(named: "security"),
            middleText: "Security and data protection"
        )
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setup() {
        addSubview(benefitTitle)
        addSubview(accountImageLabel)
        addSubview(savingLessonsLabel)
        addSubview(securityLabel)
    }

    private func setupConstraints() {
        benefitTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(3)
            make.leading.equalTo(snp.leading)
            make.height.equalTo(14)
        }

        accountImageLabel.snp.remakeConstraints { make in
            make.top.equalTo(benefitTitle.snp.bottom).offset(8)
            make.leading.equalTo(snp.leading).offset(3)
            make.height.equalTo(16)
        }

        savingLessonsLabel.snp.remakeConstraints { make in
            make.top.equalTo(accountImageLabel.snp.bottom).offset(8)
            make.leading.equalTo(snp.leading).offset(3)
            make.height.equalTo(16)
        }

        securityLabel.snp.remakeConstraints { make in
            make.top.equalTo(savingLessonsLabel.snp.bottom).offset(8)
            make.leading.equalTo(snp.leading).offset(3)
            make.height.equalTo(16)
        }
    }
}
