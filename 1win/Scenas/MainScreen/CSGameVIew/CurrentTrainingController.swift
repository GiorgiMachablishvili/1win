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

    private lazy var quizView: QuizView = {
        let view = QuizView()
        view.makeRoundCorners(32)
        view.isHidden = true

        view.didPressCloseButton = { [weak self] in
            self?.closeView()
        }
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
        view.addSubview(quizView)
    }

    private func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
//            make.top.equalTo(trainingImage.snp.bottom).offset(32 * Constraint.yCoeff)
            make.top.leading.trailing.bottom.equalToSuperview()
        }

        quizView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(477 * Constraint.yCoeff)
        }
    }

    private func unHideQuizView() {
        quizView.isHidden = false
    }

    private func pressBackButton() {
        navigationController?.popViewController(animated: true)
    }

    private func closeView() {
        quizView.isHidden = true
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

        cell.didPressGoToTestingButton = { [weak self] in
            self?.unHideQuizView()
        }
        cell.configure(with: training)
        return cell
    }
}
