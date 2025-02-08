//
//  CustomLabelView.swift
//  1win
//
//  Created by Gio's Mac on 09.02.25.
//

import UIKit
import SnapKit

class CustomLabelView: UIView {

    private let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    let middleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .left
        return label
    }()

    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let rightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        return label
    }()

    private let containerView = UIStackView()

    init(leftImage: UIImage?, middleText: String, rightText: String? = nil, rightImage: UIImage? = nil) {
        super.init(frame: .zero)
        setupView()

        leftImageView.image = leftImage
        middleLabel.text = middleText

        if let rightImage = rightImage {
            rightImageView.image = rightImage
            containerView.addArrangedSubview(rightImageView)
        } else if let rightText = rightText {
            rightLabel.text = rightText
            containerView.addArrangedSubview(rightLabel)
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        addSubview(containerView)
        containerView.axis = .horizontal
        containerView.spacing = 5
        containerView.alignment = .center

        containerView.addArrangedSubview(leftImageView)
        containerView.addArrangedSubview(middleLabel)

        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        leftImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }

        rightImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
}

