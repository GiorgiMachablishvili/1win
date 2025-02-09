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
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()

    let middleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 10)
        view.textAlignment = .left
        return view
    }()

    private let rightImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let rightLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .right
        return view
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
        containerView.distribution = .fill

        containerView.addArrangedSubview(leftImageView)
        containerView.addArrangedSubview(middleLabel)

        let rightContainer = UIView()
        rightContainer.addSubview(rightImageView)
        rightContainer.addSubview(rightLabel)

        if rightImageView.image != nil {
            rightImageView.snp.makeConstraints { make in
                make.width.height.equalTo(8)
                make.trailing.equalToSuperview().inset(16) 
                make.centerY.equalToSuperview()
            }
        }

        if rightLabel.text != nil {
            rightLabel.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
            }
        }

        containerView.addArrangedSubview(rightContainer)

        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        leftImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
}

