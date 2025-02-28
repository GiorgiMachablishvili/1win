//
//  LinksCell.swift
//  1win
//
//  Created by Gio's Mac on 09.02.25.
//

import UIKit
import SnapKit

class LinksCell: UICollectionViewCell {

    var didSecurityPolicyButtonButton: (() -> Void)?
    var didShareAppTappedButton: (() -> Void)?
    var didConditionsOfUseButton: (() -> Void)?
    var didPrivacyPolicyButton: (() -> Void)?
    var didPressRateButton: (() -> Void)?

    private lazy var viewBackgroundView: UIView = {
            let view = UIView(frame: .zero)
            view.makeRoundCorners(20)
            view.backgroundColor = UIColor.white.withAlphaComponent(0.1)
            return view
        }()

        private func createButton(leftImage: String, title: String, rightImage: String, action: Selector) -> UIButton {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            button.contentHorizontalAlignment = .left
            button.backgroundColor = .clear

            let leftImageView = UIImageView(image: UIImage(named: leftImage))
            leftImageView.contentMode = .scaleAspectFit
            button.addSubview(leftImageView)

            leftImageView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
                make.width.height.equalTo(20)
            }

            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)

            let rightImageView = UIImageView(image: UIImage(named: rightImage))
            rightImageView.contentMode = .scaleAspectFit
            button.addSubview(rightImageView)

            rightImageView.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
                make.width.height.equalTo(8)
            }

            button.addTarget(self, action: action, for: .touchUpInside)

            return button
        }

        private lazy var securityPolicyButton = createButton(leftImage: "lock", title: "Security Policy", rightImage: "pointImage", action: #selector(securityPolicyButtonTapped))
        private lazy var shareAppButton = createButton(leftImage: "share", title: "Share the app", rightImage: "pointImage", action: #selector(shareAppTapped))
        private lazy var conditionsOfUseButton = createButton(leftImage: "note", title: "Conditions of Use", rightImage: "pointImage", action: #selector(conditionsOfUseTapped))
        private lazy var privacyPolicyButton = createButton(leftImage: "messages", title: "Privacy Policy", rightImage: "pointImage", action: #selector(privacyPolicyTapped))
        private lazy var rateTheAppButton = createButton(leftImage: "like", title: "Rate the app", rightImage: "pointImage", action: #selector(rateTheAppTapped))

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
        addSubview(viewBackgroundView)

        let buttons = [
            securityPolicyButton,
            shareAppButton,
            conditionsOfUseButton,
            privacyPolicyButton,
            rateTheAppButton
        ]

        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fillEqually

        viewBackgroundView.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }

    private func setupConstraints() {
        viewBackgroundView.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
        }
    }

    // TODO: add links
    @objc private func securityPolicyButtonTapped() {
        didSecurityPolicyButtonButton?()
    }

    @objc private func shareAppTapped() {
        didShareAppTappedButton?()
    }

    @objc private func conditionsOfUseTapped() {
        didConditionsOfUseButton?()
    }

    @objc private func privacyPolicyTapped() {
        didPrivacyPolicyButton?()
    }

    @objc private func rateTheAppTapped() {
        didPressRateButton?()
    }
}
