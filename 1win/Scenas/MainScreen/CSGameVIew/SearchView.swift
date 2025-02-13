//
//  SearchView.swift
//  1win
//
//  Created by Gio's Mac on 11.02.25.
//

import UIKit
import SnapKit

class SearchView: UIView {

    var didPressBackButton: (() -> Void)?

    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "backButton"), for: .normal)
        view.contentMode = .scaleAspectFit
        view.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return view
    }()

    private lazy var searchBarView: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.placeholder = "Search..."
        view.searchBarStyle = .minimal
        view.tintColor = .whiteColor
        view.searchTextField.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.1)
        view.searchTextField.textColor = .whiteColor
        view.searchTextField.font = UIFont.goldmanBold(size: 14)
        view.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.whiteColor.withAlphaComponent(0.5)]
        )
        view.makeRoundCorners(30)
        view.clipsToBounds = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hexString: "#1E1D23")
        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(backButton)
        addSubview(searchBarView)
    }

    private func setupConstraints() {
        backButton.snp.remakeConstraints { make in
            make.bottom.equalTo(snp.bottom)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.width.equalTo(44 * Constraint.yCoeff)
        }

        searchBarView.snp.remakeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.trailing).offset(8 * Constraint.xCoeff)
            make.trailing.equalTo(snp.trailing).offset(-20 * Constraint.xCoeff)
            make.height.equalTo(44 * Constraint.yCoeff)
        }
    }

    @objc private func backButtonPressed() {
        didPressBackButton?()
    }
}
