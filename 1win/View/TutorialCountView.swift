//
//  tutorialCountView.swift
//  1win
//
//  Created by Gio's Mac on 17.02.25.
//

import UIKit
import SnapKit

class TutorialCountView: UIView {
    private var tournamentInfoBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.signInButtonBackgroundColor
        view.makeRoundCorners(6)
        return view
    }()

    private lazy var tutorialImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "tutorialImage")
        view.contentMode = .scaleToFill
        return view
    }()

    lazy var tutorialLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "14"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 10)
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
        addSubview(tournamentInfoBackground)
        addSubview(tutorialImage)
        addSubview(tutorialLabel)
    }

    private func setupConstraints() {
        tournamentInfoBackground.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        tutorialImage.snp.remakeConstraints { make in
            make.centerY.equalTo(tournamentInfoBackground)
            make.trailing.equalTo(tournamentInfoBackground.snp.trailing).offset(-9 * Constraint.xCoeff)
            make.height.equalTo(12 * Constraint.yCoeff)
            make.width.equalTo(13 * Constraint.xCoeff)
        }

        tutorialLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(tutorialImage)
            make.trailing.equalTo(tutorialImage.snp.leading).offset(-5 * Constraint.xCoeff)
            make.height.equalTo(12 * Constraint.yCoeff)
        }
    }
}
