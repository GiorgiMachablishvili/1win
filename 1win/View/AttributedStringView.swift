//
//  AttributedStringView.swift
//  1win
//
//  Created by Gio's Mac on 10.02.25.
//

import UIKit
import SnapKit

class AttributedStringView: UIView {

    private lazy var leftImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.6)
        view.textAlignment = .left
        return view
    }()

    private lazy var rightText: UILabel = {
        let view = UILabel()
        view.font = UIFont.montserratVariableFontWght(size: 12)
        view.textColor = UIColor.whiteColor.withAlphaComponent(0.6)
        view.textAlignment = .right
        return view
    }()

    init(leftImage: UIImage?, text: String, text2: String) {
        super.init(frame: .zero)
        setupView(leftImage: leftImage, text: text, text2: text2)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(leftImage: UIImage?, text: String, text2: String) {
        addSubview(leftImageView)
        addSubview(textLabel)
        addSubview(rightText)

        leftImageView.image = leftImage
        textLabel.text = text
        rightText.text = text2
    }

    private func setupConstraints() {
        leftImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }

        textLabel.snp.makeConstraints { make in
            make.leading.equalTo(leftImageView.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
            make.height.equalTo(15)
        }

        rightText.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.height.equalTo(15)
        }
    }
}
