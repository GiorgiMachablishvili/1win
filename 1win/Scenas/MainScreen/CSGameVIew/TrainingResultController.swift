//
//  TrainingResultController.swift
//  1win
//
//  Created by Gio's Mac on 16.02.25.
//

import UIKit
import SnapKit

class TrainingResultController: UIViewController {
    var percentage: String = "0%"

    var trainings: [TrainingModel] = []

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 150)
        layout.minimumLineSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(TrainingResultCell.self, forCellWithReuseIdentifier: TrainingResultCell.identifier)
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
            make.edges.equalToSuperview()
        }
    }

    private func goGameControllerView() {
        if let navigationController = self.navigationController {
            for controller in navigationController.viewControllers {
                if let gameController = controller as? GameController {
                    navigationController.popToViewController(gameController, animated: true)
                    return
                }
            }
        }
    }
}

extension TrainingResultController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainingResultCell.identifier, for: indexPath) as? TrainingResultCell else {
            return UICollectionViewCell()
        }
        let training = trainings[indexPath.item]
        cell.configure(with: training, percentage: percentage)

        cell.didPressBackButton = { [weak self] in
            self?.goGameControllerView()
        }

        cell.didPressGoToTestingButton = { [weak self] in
            self?.goGameControllerView()
        }
        return cell
    }
}
