//
//  CreateAndDeleteCell.swift
//  1win
//
//  Created by Gio's Mac on 10.02.25.
//

import UIKit
import SnapKit

class CreateAndDeleteCell: UICollectionViewCell {
    private lazy var signInWithAppleButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sign in with apple", for: .normal)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.backgroundColor = UIColor.signInButtonBackgroundColor
        view.makeRoundCorners(16)
        view.titleLabel?.font = UIFont.goldmanBold(size: 14)
        let image = UIImage(named: "apple")?.withRenderingMode(.alwaysOriginal)
        let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 24, height: 24)).image { _ in
            image?.draw(in: CGRect(origin: .zero, size: CGSize(width: 24, height: 24)))
        }
        view.setImage(resizedImage, for: .normal)
        view.imageView?.contentMode = .scaleAspectFit
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        view.contentHorizontalAlignment = .center
        view.isHidden = true
        view.addTarget(self, action: #selector(clickSignInWithAppleButton), for: .touchUpInside)
        return view
    }()

    private lazy var deleteButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Delete Account", for: .normal)
        view.setTitleColor(UIColor.redColor, for: .normal)
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(clickDeleteButton), for: .touchUpInside)

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
        addSubview(signInWithAppleButton)
        addSubview(deleteButton)
    }

    private func setupConstraints() {
        signInWithAppleButton.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(60)
        }

        deleteButton.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(60)
        }
    }

    @objc private func clickSignInWithAppleButton() {

    }

    @objc private func clickDeleteButton() {

    }
}
