//
//  GameButtonCell.swift
//  1win
//
//  Created by Gio's Mac on 17.02.25.
//

import UIKit
import SnapKit

class GameButtonCell: UICollectionViewCell {

    private lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitleColor(UIColor.whiteColor.withAlphaComponent(0.7), for: .normal)
        view.backgroundColor = UIColor.viewControllerBackgroundColor
        view.titleLabel?.font = UIFont.goldmanBold(size: 14)
        view.makeRoundCorners(20)
        view.imageView?.contentMode = .scaleAspectFit
        view.contentHorizontalAlignment = .center
        view.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return view
    }()

    var buttonTapAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String, isSelected: Bool) {
        button.setTitle(title, for: .normal)

        button.backgroundColor = isSelected ? UIColor.blue : UIColor.viewControllerBackgroundColor
        button.setTitleColor(isSelected ? UIColor.white : UIColor.white.withAlphaComponent(0.7), for: .normal)
    }

    @objc private func buttonTapped() {
        buttonTapAction?()
    }
}
