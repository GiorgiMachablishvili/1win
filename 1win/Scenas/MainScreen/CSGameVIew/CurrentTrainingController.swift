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

    let quizData: [String: [QuizQuestion]] = [
        "The Mirage A Execution": [
            QuizQuestion(question: "What is the main objective of the Mirage A Execution?",
                         options: ["Rush B with no utility", "Gain mid control and rotate to A", "Execute onto A using Smokes and Flashes", "Fake an A push and go B"],
                         correctAnswer: "Execute onto A using Smokes and Flashes"),

            QuizQuestion(question: "Which Smokes are necessary for this execution?",
                         options: ["Jungle, CT, Stairs", "B Short, Window, Mid", "B Apps, Market, Van", "No Smokes are needed"],
                         correctAnswer: "Jungle, CT, Stairs"),

            QuizQuestion(question: "What is the purpose of the Flashbangs in this strategy?",
                         options: ["To blind your teammates", "To block enemy vision", "To blind defenders peeking A Site", "To delay a retake"],
                         correctAnswer: "To blind defenders peeking A Site"),

            QuizQuestion(question: "Where should the Molotov be placed?",
                         options: ["CT Spawn", "Default (common plant spot)", "Mid Window", "Jungle"],
                         correctAnswer: "Default (common plant spot)"),

            QuizQuestion(question: "What is the best post-plant setup for this tactic?",
                         options: ["All five players hide in T-Spawn", "One player Ramp, one in Palace, and others covering Jungle and CT", "Everyone stays on the bombsite", "Rush into Market"],
                         correctAnswer: "One player Ramp, one in Palace, and others covering Jungle and CT")
        ]
    ]


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
            make.edges.equalToSuperview()
        }
    }

    //    private func unHideQuizView() {
    //        quizView.isHidden = false
    //    }

    private func unHideQuizView() {
        if let quiz = quizData[training.title] {
            quizView.configure(with: quiz)
        }
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
