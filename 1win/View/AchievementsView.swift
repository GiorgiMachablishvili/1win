//
//  AchievementsView.swift
//  1win
//
//  Created by Gio's Mac on 17.02.25.
//

import UIKit
import SnapKit

class AchievementsView: UIView {

    var didPressCancelButton: (() -> Void)?

    private lazy var mainBlackView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "#000000CC")
        return view
    }()

    private lazy var achievementsView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.viewBackgroundColor
        view.makeRoundCorners(32)
        return view
    }()

    private lazy var achievementsLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Achievements"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var achievementsImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "firstStep")
        view.contentMode = .scaleToFill
        return view
    }()

    private lazy var achievementsTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Achievements"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .center
        return view
    }()

    private lazy var achievementsDescription: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Complete your first lesson"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.25)
        view.font = UIFont.goldmanBold(size: 14)
        view.textAlignment = .center
        return view
    }()

    private lazy var cancelButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Cancel", for: .normal)
        view.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.15)
        view.titleLabel?.font = UIFont.goldmanBold(size: 14)
        view.makeRoundCorners(20)
        view.addTarget(self, action: #selector(clickCancelButton), for: .touchUpInside)
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
        addSubview(mainBlackView)
        addSubview(achievementsView)
        addSubview(achievementsLabel)
        addSubview(achievementsImage)
        addSubview(achievementsTitle)
        addSubview(achievementsDescription)
        addSubview(cancelButton)
    }

    private func setupConstraints() {
        mainBlackView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        achievementsView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(483 * Constraint.yCoeff)
        }

        achievementsLabel.snp.remakeConstraints { make in
            make.top.equalTo(achievementsView.snp.top).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(achievementsView.snp.leading).offset(20 * Constraint.yCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }

        achievementsImage.snp.remakeConstraints { make in
            make.top.equalTo(achievementsLabel.snp.bottom).offset(44 * Constraint.yCoeff)
            make.centerX.equalTo(achievementsView)
            make.height.equalTo(158 * Constraint.yCoeff)
            make.width.equalTo(140 * Constraint.yCoeff)
        }

        achievementsTitle.snp.remakeConstraints { make in
            make.top.equalTo(achievementsImage.snp.bottom).offset(44 * Constraint.yCoeff)
            make.centerX.equalTo(achievementsView)
            make.height.equalTo(20 * Constraint.yCoeff)
        }

        achievementsDescription.snp.remakeConstraints { make in
            make.top.equalTo(achievementsTitle.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }

        cancelButton.snp.remakeConstraints { make in
            make.bottom.equalTo(snp.bottom).offset(-44 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(60 * Constraint.yCoeff)
        }
    }

    @objc private func clickCancelButton() {
        didPressCancelButton?()
    }

    func setAchievementDetails(title: String, imageName: String, description: String) {
        achievementsTitle.text = title
        achievementsDescription.text = description

        print("Setting image: \(imageName)")

        if let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal) {
            achievementsImage.image = image
            achievementsImage.setNeedsDisplay()
        } else {
            print("⚠️ Image not found: \(imageName)")
        }

        isHidden = false
    }

}
