//
//  TrainingModel.swift
//  1win
//
//  Created by Gio's Mac on 16.02.25.
//

import Foundation

protocol TrainingModel {
    var image: String { get }
    var title: String { get }
    var description: String { get }
    var steps: String { get }
    var advantage: String { get }
}

struct TrainingModelCS: TrainingModel {
    let image: String
    let title: String
    let description: String
    let steps: String
    let advantage: String
}

struct TrainingModelDota2: TrainingModel {
    let image: String
    let title: String
    let description: String
    let steps: String
    let advantage: String
}

struct TrainingModelLoL: TrainingModel {
    let image: String
    let title: String
    let description: String
    let steps: String
    let advantage: String
}


struct TrainingModelValorant: TrainingModel {
    let image: String
    let title: String
    let description: String
    let steps: String
    let advantage: String
}
