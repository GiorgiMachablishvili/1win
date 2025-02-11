//
//  PopularTrainingCell.swift
//  1win
//
//  Created by Gio's Mac on 11.02.25.
//

import UIKit
import SnapKit

class PopularTrainingCell: UICollectionViewCell {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - (40 * Constraint.xCoeff), height: 210)
        layout.minimumLineSpacing = 10

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(TrainingCell.self, forCellWithReuseIdentifier: "TrainingCell")
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
        addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension PopularTrainingCell: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - UICollectionView DataSource & Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainingCell", for: indexPath) as? TrainingCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}



