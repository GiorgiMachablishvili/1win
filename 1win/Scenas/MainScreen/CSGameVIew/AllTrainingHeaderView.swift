//
//  AllTrainingHeaderView.swift
//  1win
//
//  Created by Gio's Mac on 12.02.25.
//

import UIKit
import SnapKit

class AllTrainingHeaderView: UICollectionReusableView {
    static let identifier = "AllTrainingHeaderView"

    private lazy var allTrainingTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "All training"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 20)
        view.textAlignment = .left
        return view
    }()

    private lazy var numberOfTraining: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "5"
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.3)
        view.font = UIFont.goldmanBold(size: 12)
        view.textAlignment = .left
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
        addSubview(allTrainingTitle)
        addSubview(numberOfTraining)
    }

    private func setupConstraints() {
        allTrainingTitle.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }

        numberOfTraining.snp.remakeConstraints { make in
            make.top.equalTo(allTrainingTitle.snp.top)
            make.leading.equalTo(allTrainingTitle.snp.trailing).offset(4 * Constraint.xCoeff)
            make.height.equalTo(14)
        }
    }
}
