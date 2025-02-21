//
//  ChangeImageCell.swift
//  1win
//
//  Created by Gio's Mac on 09.02.25.
//

import UIKit
import SnapKit

class ChangeImageCell: UICollectionViewCell {

    var pressChangeImageButton: (() -> Void)?

    private lazy var changeImageButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "changeImage"), for: .normal)
        view.backgroundColor = UIColor.clear
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(clickChangeImageButton), for: .touchUpInside)
        return view
    }()

    private lazy var userName: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "USER42343"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 14)
        view.textAlignment = .center
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
        addSubview(changeImageButton)
        addSubview(userName)
    }

    private func setupConstraints() {
        changeImageButton.snp.remakeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(snp.top).offset(105 * Constraint.yCoeff)
            make.height.width.equalTo(120 * Constraint.yCoeff)
        }

        userName.snp.remakeConstraints { make in
            make.top.equalTo(changeImageButton.snp.bottom).offset(16 * Constraint.yCoeff)
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
    }

    @objc private func clickChangeImageButton() {
        pressChangeImageButton?()
    }

    func updateProfileImage(image: UIImage) {
        changeImageButton.setImage(image, for: .normal)
    }
}
