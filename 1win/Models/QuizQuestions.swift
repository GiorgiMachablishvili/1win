//
//  QuizQuestions.swift
//  1win
//
//  Created by Gio's Mac on 16.02.25.
//

import Foundation

protocol QuizQuestion {
    var question: String { get }
    var options: [String] { get }
    var correctAnswer: String { get }
}

struct QuizCSQuestion: QuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: String
}

struct QuizDota2Question: QuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: String
}

struct QuizLOLQuestion: QuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: String
}


struct QuizValorantQuestion: QuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: String
}
