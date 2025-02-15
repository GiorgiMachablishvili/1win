//
//  PopularTrainingCell.swift
//  1win
//
//  Created by Gio's Mac on 11.02.25.
//

import UIKit
import SnapKit

class PopularTrainingCell: UICollectionViewCell {

    var trainings: [TrainingModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    private lazy var popularTrainingTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Popular training"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 20)
        view.textAlignment = .left
        return view
    }()
    
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
        addSubview(popularTrainingTitle)
        addSubview(collectionView)
    }

    private func setupConstraints() {
        popularTrainingTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(16 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(20 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(popularTrainingTitle.snp.bottom).offset(14 * Constraint.yCoeff)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}

extension PopularTrainingCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trainings.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainingCell", for: indexPath) as? TrainingCell else {
            return UICollectionViewCell()
        }
        let training = trainings[indexPath.item]
        cell.configure(with: training)
        return cell
    }
}



