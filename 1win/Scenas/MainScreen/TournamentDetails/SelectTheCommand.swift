//
//  SelectTheCommand.swift
//  1win
//
//  Created by Gio's Mac on 11.02.25.
//
//


import UIKit
import SnapKit

class SelectTheCommand: UIView {

    var didiPressVoteButton: (() -> Void)?
    var didPressCloseButton: (() -> Void)?

    private let teams: [TournamentTeam] = [
        TournamentTeam(imageName: "navi", title: "Navi"),
        TournamentTeam(imageName: "spirit", title: "Spirit"),
        TournamentTeam(imageName: "G2", title: "G2"),
        TournamentTeam(imageName: "vitality", title: "Vitality"),
        TournamentTeam(imageName: "betBoom", title: "BetBoom"),
        TournamentTeam(imageName: "ef", title: "EF"),
        TournamentTeam(imageName: "heroic", title: "Heroic"),
        TournamentTeam(imageName: "pianN", title: "PianN")
    ]

    private var selectedTeamIndex: Int? {
        didSet {
            updateSelectionUI()
        }
    }

    private lazy var selectTheCommandTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Select the command "
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .left
        return view
    }()

    private lazy var closeButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "close"), for: .normal)
        view.tintColor = UIColor.white.withAlphaComponent(0.4)
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return view
    }()

    private lazy var teamsGridView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .equalSpacing
        return view
    }()

    private lazy var voteButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("VOTE", for: .normal)
        view.setTitleColor(.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanBold(size: 16)
        view.backgroundColor = .signInButtonBackgroundColor.withAlphaComponent(0.2)
        view.makeRoundCorners(12)
        view.isUserInteractionEnabled = false
        view.addTarget(self, action: #selector(voteButtonPressed), for: .touchUpInside)
        return view
    }()

    private lazy var cancelButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Cancel", for: .normal)
        view.setTitleColor(.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanBold(size: 16)
        view.backgroundColor = .whiteColor.withAlphaComponent(0.2)
        view.makeRoundCorners(12)
        view.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return view
    }()

    private var teamViews: [UIView] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(selectTheCommandTitle)
        addSubview(closeButton)
        addSubview(teamsGridView)
        addSubview(voteButton)
        addSubview(cancelButton)

        // Creating the 2-column layout
        for i in stride(from: 0, to: teams.count, by: 2) {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 8
            rowStackView.distribution = .fillEqually

            let firstTeamView = createTeamView(imageName: teams[i].imageName, title: teams[i].title, index: i)
            teamViews.append(firstTeamView)
            rowStackView.addArrangedSubview(firstTeamView)

            if i + 1 < teams.count {
                let secondTeamView = createTeamView(imageName: teams[i + 1].imageName, title: teams[i + 1].title, index: i + 1)
                teamViews.append(secondTeamView)
                rowStackView.addArrangedSubview(secondTeamView)
            }

            teamsGridView.addArrangedSubview(rowStackView)
        }
    }

    private func setupConstraints() {
        selectTheCommandTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(22.5 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(19 * Constraint.yCoeff)
        }

        closeButton.snp.remakeConstraints { make in
            make.centerY.equalTo(selectTheCommandTitle.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-20 * Constraint.xCoeff)
            make.height.width.equalTo(24)
        }

        teamsGridView.snp.makeConstraints { make in
            make.top.equalTo(selectTheCommandTitle.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
        }

        voteButton.snp.makeConstraints { make in
            make.top.equalTo(teamsGridView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(50)
//            make.bottom.equalToSuperview().offset(-20)
        }

        cancelButton.snp.remakeConstraints { make in
            make.top.equalTo(voteButton.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(20 * Constraint.xCoeff)
            make.height.equalTo(50)
        }
    }

    private func createTeamView(imageName: String, title: String, index: Int) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.1)
        containerView.makeRoundCorners(16)
        containerView.isUserInteractionEnabled = true
        containerView.snp.makeConstraints { make in
            make.width.equalTo(171 * Constraint.xCoeff)
            make.height.equalTo(115 * Constraint.yCoeff)
        }

        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .whiteColor
        titleLabel.font = UIFont.goldmanBold(size: 16)
        titleLabel.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center

        containerView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(teamViewTapped(_:)))
        containerView.addGestureRecognizer(tapGesture)
        containerView.tag = index

        return containerView
    }

    @objc private func teamViewTapped(_ sender: UITapGestureRecognizer) {
        guard let view = sender.view else { return }
        selectedTeamIndex = view.tag
    }

    private func updateSelectionUI() {
        for (index, view) in teamViews.enumerated() {
            if let selectedIndex = selectedTeamIndex, index == selectedIndex {
                view.backgroundColor = UIColor.signInButtonBackgroundColor.withAlphaComponent(0.3)
                view.layer.borderColor = UIColor.signInButtonBackgroundColor.cgColor
                view.layer.borderWidth = 2
            } else {
                view.backgroundColor = UIColor.whiteColor.withAlphaComponent(0.1)
                view.layer.borderColor = UIColor.clear.cgColor
                view.layer.borderWidth = 0
            }
        }

        if selectedTeamIndex != nil {
            voteButton.backgroundColor = .signInButtonBackgroundColor
            voteButton.isUserInteractionEnabled = true
        } else {
            voteButton.backgroundColor = .signInButtonBackgroundColor.withAlphaComponent(0.2)
            voteButton.isUserInteractionEnabled = false
        }
    }

    @objc private func voteButtonPressed() {
        didiPressVoteButton?()
    }

    @objc private func closeButtonPressed() {
        didPressCloseButton?()
    }
}
