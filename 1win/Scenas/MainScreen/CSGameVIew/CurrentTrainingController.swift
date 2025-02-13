//
//  CurrentTrainingController.swift
//  1win
//
//  Created by Gio's Mac on 12.02.25.
//

import UIKit
import SnapKit

class CurrentTrainingController: UIViewController {

    private let training: TrainingModel

        init(training: TrainingModel) {
            self.training = training
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 70)
        layout.minimumLineSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(CurrentTrainingCell.self, forCellWithReuseIdentifier: "CurrentTrainingCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .viewBackgroundColor
        setup()
        setupConstraints()
    }

    private func setup() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
//            make.top.equalTo(trainingImage.snp.bottom).offset(32 * Constraint.yCoeff)
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func pressBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension CurrentTrainingController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentTrainingCell", for: indexPath) as? CurrentTrainingCell else {
            return UICollectionViewCell()
        }
        cell.didPressBackButton = { [weak self] in
            self?.pressBackButton()
        }
        cell.configure(with: training)
        return cell
    }
}
