//
//  TrainingMaterialsView.swift
//  1win
//
//  Created by Gio's Mac on 09.02.25.
//

import UIKit
import SnapKit

class TrainingMaterialsView: UIView {

    var didPressCSButton: ((String) -> Void)?
    var didPressDotaButton: ((String) -> Void)?
    var didPressLOLButton: ((String) -> Void)?
    var didPressValorantButton: ((String) -> Void)?

    let csTrainingsCount = trainingsCS.count
    let dots2TrainingsCount = trainingsDota2.count
    let lolTrainingsCount = trainingsLoL.count
    let valorantTrainingsCount = trainingsValorant.count

    private lazy var trainingMaterialsTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Training materials"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 20)
        view.textAlignment = .left
        return view
    }()

    private lazy var csButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "cs"), for: .normal)
        view.backgroundColor = UIColor.clear
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(28)
        view.addTarget(self, action: #selector(clickCsButton), for: .touchUpInside)
        return view
    }()

    private lazy var csImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "csGoBlueImage")
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var csTutorialCountLabel: TutorialCountView = {
        let view = TutorialCountView()
        view.tutorialLabel.text = "\(csTrainingsCount)"
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var dota2Button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "dota"), for: .normal)
        view.backgroundColor = UIColor.clear
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(28)
        view.addTarget(self, action: #selector(clickDota2Button), for: .touchUpInside)
        return view
    }()

    private lazy var dota2Image: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "dota2BlueImage")
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var dota2TutorialCountLabel: TutorialCountView = {
        let view = TutorialCountView()
        view.tutorialLabel.text = "\(dots2TrainingsCount)"
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var leagueOfLegendsButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "league"), for: .normal)
        view.backgroundColor = UIColor.clear
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(28)
        view.addTarget(self, action: #selector(clickLeagueOfLegendsButton), for: .touchUpInside)
        return view
    }()

    private lazy var leagueOfLegendsImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "leagueBlueImage")
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var leagueOfLegendsTutorialCountLabel: TutorialCountView = {
        let view = TutorialCountView()
        view.tutorialLabel.text = "\(lolTrainingsCount)"
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var valorantButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "valorant"), for: .normal)
        view.backgroundColor = UIColor.clear
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(28)
        view.addTarget(self, action: #selector(clickValorantButton), for: .touchUpInside)
        return view
    }()

    private lazy var valorantImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "valorantBlueImage")
        view.contentMode = .scaleAspectFit
        view.makeRoundCorners(12)
        return view
    }()

    private lazy var valorantTutorialCountLabel: TutorialCountView = {
        let view = TutorialCountView()
        view.tutorialLabel.text = "\(valorantTrainingsCount)"
        view.makeRoundCorners(12)
        return view
    }()

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
        addSubview(trainingMaterialsTitle)
        addSubview(csButton)
        addSubview(csImage)
        addSubview(csTutorialCountLabel)
        addSubview(dota2Button)
        addSubview(dota2Image)
        addSubview(dota2TutorialCountLabel)
        addSubview(leagueOfLegendsButton)
        addSubview(leagueOfLegendsImage)
        addSubview(leagueOfLegendsTutorialCountLabel)
        addSubview(valorantButton)
        addSubview(valorantImage)
        addSubview(valorantTutorialCountLabel)
    }

    private func setupConstraints() {
        trainingMaterialsTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(1 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }

        csButton.snp.remakeConstraints { make in
            make.top.equalTo(trainingMaterialsTitle.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(167 * Constraint.yCoeff)
            make.width.equalTo(178 * Constraint.xCoeff)
        }

        csImage.snp.remakeConstraints { make in
            make.top.equalTo(csButton.snp.top).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(csButton.snp.leading).offset(8 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
            make.width.equalTo(32 * Constraint.xCoeff)
        }

        csTutorialCountLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(csImage)
            make.trailing.equalTo(csButton.snp.trailing).offset(-8 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
            make.width.equalTo(46 * Constraint.xCoeff)
        }

        dota2Button.snp.remakeConstraints { make in
            make.top.equalTo(trainingMaterialsTitle.snp.bottom).offset(16 * Constraint.yCoeff)
            make.trailing.equalTo(snp.trailing).offset(-20 * Constraint.xCoeff)
            make.height.equalTo(167 * Constraint.yCoeff)
            make.width.equalTo(178 * Constraint.xCoeff)
        }

        dota2Image.snp.remakeConstraints { make in
            make.top.equalTo(dota2Button.snp.top).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(dota2Button.snp.leading).offset(8 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
            make.width.equalTo(32 * Constraint.xCoeff)
        }

        dota2TutorialCountLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(dota2Image)
            make.trailing.equalTo(dota2Button.snp.trailing).offset(-8 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
            make.width.equalTo(46 * Constraint.xCoeff)
        }

        leagueOfLegendsButton.snp.remakeConstraints { make in
            make.top.equalTo(csButton.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(167 * Constraint.yCoeff)
            make.width.equalTo(178 * Constraint.xCoeff)
        }

        leagueOfLegendsImage.snp.remakeConstraints { make in
            make.top.equalTo(leagueOfLegendsButton.snp.top).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(leagueOfLegendsButton.snp.leading).offset(8 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
            make.width.equalTo(32 * Constraint.xCoeff)
        }

        leagueOfLegendsTutorialCountLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(leagueOfLegendsImage)
            make.trailing.equalTo(leagueOfLegendsButton.snp.trailing).offset(-8 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
            make.width.equalTo(46 * Constraint.xCoeff)
        }

        valorantButton.snp.remakeConstraints { make in
            make.top.equalTo(dota2Button.snp.bottom).offset(16 * Constraint.yCoeff)
            make.trailing.equalTo(snp.trailing).offset(-20 * Constraint.xCoeff)
            make.height.equalTo(167 * Constraint.yCoeff)
            make.width.equalTo(178 * Constraint.xCoeff)
        }

        valorantImage.snp.remakeConstraints { make in
            make.top.equalTo(valorantButton.snp.top).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(valorantButton.snp.leading).offset(8 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
            make.width.equalTo(32 * Constraint.xCoeff)
        }

        valorantTutorialCountLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(valorantImage)
            make.trailing.equalTo(valorantButton.snp.trailing).offset(-8 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
            make.width.equalTo(46 * Constraint.xCoeff)
        }
    }

    @objc private func clickCsButton() {
        didPressCSButton?("CS")
    }

    @objc private func clickDota2Button() {
        didPressDotaButton?("Dota2")
    }

    @objc private func clickLeagueOfLegendsButton() {
        didPressLOLButton?("LOL")
    }

    @objc private func clickValorantButton() {
        didPressValorantButton?("Valorant")
    }
}
