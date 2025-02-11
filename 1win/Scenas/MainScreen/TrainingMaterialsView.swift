//
//  TrainingMaterialsView.swift
//  1win
//
//  Created by Gio's Mac on 09.02.25.
//

import UIKit
import SnapKit

class TrainingMaterialsView: UIView {

    var didPressCSButton: (() -> Void)?

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
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(clickCsButton), for: .touchUpInside)
        return view
    }()

    private lazy var dota2Button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "dota"), for: .normal)
        view.backgroundColor = UIColor.clear
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(clickDota2Button), for: .touchUpInside)
        return view
    }()

    private lazy var leagueOfLegendsButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "league"), for: .normal)
        view.backgroundColor = UIColor.clear
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(clickLeagueOfLegendsButton), for: .touchUpInside)
        return view
    }()

    private lazy var valorantButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "valorant"), for: .normal)
        view.backgroundColor = UIColor.clear
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(clickValorantButton), for: .touchUpInside)
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
        addSubview(dota2Button)
        addSubview(leagueOfLegendsButton)
        addSubview(valorantButton)
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

        dota2Button.snp.remakeConstraints { make in
            make.top.equalTo(trainingMaterialsTitle.snp.bottom).offset(16 * Constraint.yCoeff)
            make.trailing.equalTo(snp.trailing).offset(-20 * Constraint.xCoeff)
            make.height.equalTo(167 * Constraint.yCoeff)
            make.width.equalTo(178 * Constraint.xCoeff)
        }

        leagueOfLegendsButton.snp.remakeConstraints { make in
            make.top.equalTo(csButton.snp.bottom).offset(16 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(167 * Constraint.yCoeff)
            make.width.equalTo(178 * Constraint.xCoeff)
        }

        valorantButton.snp.remakeConstraints { make in
            make.top.equalTo(dota2Button.snp.bottom).offset(16 * Constraint.yCoeff)
            make.trailing.equalTo(snp.trailing).offset(-20 * Constraint.xCoeff)
            make.height.equalTo(167 * Constraint.yCoeff)
            make.width.equalTo(178 * Constraint.xCoeff)
        }
    }

    @objc private func clickCsButton() {
        didPressCSButton?()
    }

    @objc private func clickDota2Button() {

    }

    @objc private func clickLeagueOfLegendsButton() {

    }

    @objc private func clickValorantButton() {

    }
}
