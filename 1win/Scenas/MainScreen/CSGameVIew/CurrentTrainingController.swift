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
    private let selectedQuestions: [QuizQuestion]
    private let gameType: String 

    init(training: TrainingModel, questions: [QuizQuestion], gameType: String) {
        self.training = training
        self.selectedQuestions = questions
        self.gameType = gameType
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

        view.didFinishQuiz = { [weak self] correctAnswers, totalQuestions in
            self?.showQuizResultView(correctAnswers: correctAnswers, totalQuestions: totalQuestions)
        }
        return view
    }()

    private lazy var quizResult: QuizResultView = {
        let view = QuizResultView()
        view.makeRoundCorners(32)
        view.isHidden = true
        view.didPressCloseButton = { [weak self] in
            self?.pressHideQuizResult()
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
        view.addSubview(quizResult)
    }

    private func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
            //            make.top.equalTo(trainingImage.snp.bottom).offset(32 * Constraint.yCoeff)
            make.top.leading.trailing.bottom.equalToSuperview()
        }

        quizView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        quizResult.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

    }

    private func unHideQuizView() {
        quizView.configure(with: selectedQuestions)
        quizView.isHidden = false
    }

    private func showQuizResultView(correctAnswers: Int, totalQuestions: Int) {
        quizResult.updateResult(correctAnswers: correctAnswers, totalQuestions: totalQuestions)
        quizResult.isHidden = false
        quizView.isHidden = true
    }

    func updateResult(correctAnswers: Int, totalQuestions: Int) {
        quizResult.quizResultLabel.attributedText = quizResult.createExpAttributedString(correctAnswers: correctAnswers, totalQuestions: totalQuestions)
    }

    private func pressBackButton() {
        navigationController?.popViewController(animated: true)
    }

    private func closeView() {
        let selectedQuizData: [QuizQuestion]

        switch gameType {
        case "Dota2":
            selectedQuizData = quizDota2Data
        case "LOL":
            selectedQuizData = quizLoLData
        case "Valorant":
            selectedQuizData = quizValorantData
        default:
            selectedQuizData = quizCSData
        }

        // Get a new random set of 5 questions
        let randomQuestions = Array(selectedQuizData.shuffled().prefix(5))

        // Configure quizView with new questions before hiding
        quizView.configure(with: randomQuestions)

        quizView.isHidden = true
    }

    private func pressHideQuizResult() {
        quizResult.isHidden = true
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
