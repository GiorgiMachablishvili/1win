//
//  AllTrainingCell.swift
//  1win
//
//  Created by Gio's Mac on 12.02.25.
//

import UIKit
import SnapKit

class AllTrainingCell: UICollectionViewCell {
    private lazy var trainingImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "csGoImage")
        view.contentMode = .scaleToFill
        view.makeRoundCorners(16)
        return view
    }()

    private lazy var trainingTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Fast A Split"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
        return view
    }()

    private lazy var trainingInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Dust2, Attack on A, Fast Separation, Flashes and Smokejumpers"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.1)
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
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
        addSubview(trainingImage)
        addSubview(trainingTitle)
        addSubview(trainingInfoLabel)
    }

    private func setupConstraints() {
        trainingImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.width.equalTo(80 * Constraint.yCoeff)
        }

        trainingTitle.snp.remakeConstraints { make in
            make.top.equalTo(trainingImage.snp.top).offset(19 * Constraint.yCoeff)
            make.leading.equalTo(trainingImage.snp.trailing).offset(12 * Constraint.xCoeff)
            make.height.equalTo(14 * Constraint.yCoeff)
        }

        trainingInfoLabel.snp.remakeConstraints { make in
            make.top.equalTo(trainingTitle.snp.bottom).offset(4 * Constraint.yCoeff)
            make.leading.equalTo(trainingImage.snp.trailing).offset(12 * Constraint.xCoeff)
            make.width.equalTo(246 * Constraint.xCoeff)
        }
    }

    func configure(with data: TrainingModel) {
        trainingImage.image = UIImage(named: data.image)
        trainingTitle.text = data.title
        trainingInfoLabel.text = data.description
    }
}
