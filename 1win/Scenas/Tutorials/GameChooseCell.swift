//
//  GameChooseCell.swift
//  1win
//
//  Created by Gio's Mac on 16.02.25.
//
import UIKit
import SnapKit

class GameChooseCell: UICollectionViewCell {

    private let gameTitles = ["All", "CS:GO", "Dota 2", "LoL", "Valorant"]

    private var selectedIndex: Int? = 0

    var didSelectGame: ((String) -> Void)?

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8 * Constraint.xCoeff

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(GameButtonCell.self, forCellWithReuseIdentifier: "GameButtonCell")
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
        addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension GameChooseCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameTitles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameButtonCell", for: indexPath) as? GameButtonCell else {
            return UICollectionViewCell()
        }

        let title = gameTitles[indexPath.item]
        cell.configure(title: title, isSelected: selectedIndex == indexPath.item)

        cell.buttonTapAction = { [weak self] in
            self?.selectedIndex = indexPath.item
            self?.collectionView.reloadData()
            self?.didSelectGame?(title)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90 * Constraint.xCoeff, height: 40 * Constraint.yCoeff)
    }
}
