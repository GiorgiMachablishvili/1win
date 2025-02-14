//
//  QuizQuestion.swift
//  1win
//
//  Created by Gio's Mac on 13.02.25.
//

import Foundation

struct QuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: String
}

let quizData: [QuizQuestion] = [

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
                 correctAnswer: "One player Ramp, one in Palace, and others covering Jungle and CT"),

    QuizQuestion(question: "Why do you need a player in Palace?",
                 options: ["To watch Mid rotations", "To shoot enemies in CT Spawn", "To provide a crossfire with Ramp players", "To plant the bomb"],
                 correctAnswer: "To provide a crossfire with Ramp players"),

    QuizQuestion(question: "Which weapon is best for holding Ramp after the bomb is planted?",
                 options: ["AWP", "P90", "Glock", "Nova"],
                 correctAnswer: "AWP"),

    QuizQuestion(question: "What should the Mid player do in this tactic?",
                 options: ["Hold Connector and prevent CT rotations", "Rush B Apartments", "Hide in T-Spawn", "Rotate back to spawn"],
                 correctAnswer: "Hold Connector and prevent CT rotations"),

    QuizQuestion(question: "Which situation would make this tactic ineffective?",
                 options: ["CTs stacking B", "AWP holding from Ticket Booth without Smokes", "A single CT on A Site", "Default Smokes being thrown"],
                 correctAnswer: "AWP holding from Ticket Booth without Smokes"),

    QuizQuestion(question: "What is a common mistake while executing this tactic?",
                 options: ["Not throwing Flashes over A", "Entering the site before utility lands", "Not checking Stairs and Jungle", "All of the above"],
                 correctAnswer: "All of the above"),

    QuizQuestion(question: "What is the main goal of this tactic?",
                 options: ["Fake a B rush and rotate to A", "Gain Mid control and push both Catwalk and B Apartments", "Rush B without utility", "Camp in Underpass and wait for CTs"],
                 correctAnswer: "Gain Mid control and push both Catwalk and B Apartments"),

    QuizQuestion(question: "Which Smokes are required for a successful Mid split?",
                 options: ["B Short, Van, Market", "Window, Connector, Catwalk", "B Apps, Market, Car", "A Stairs, Jungle, CT"],
                 correctAnswer: "Window, Connector, Catwalk"),

    QuizQuestion(question: "Why do two players push from B Apartments?",
                 options: ["To bait the enemy while others push Mid", "To create a crossfire with Catwalk players", "To make noise and distract the enemy", "To camp in Apartments"],
                 correctAnswer: "To create a crossfire with Catwalk players"),

    QuizQuestion(question: "What is the primary role of the Mid player who moves through Underpass?",
                 options: ["To flank A Site", "To hold Mid control", "To come up Connector if needed", "To reinforce the Catwalk push"],
                 correctAnswer: "To reinforce the Catwalk push"),

    QuizQuestion(question: "What utility should be used to block CT rotations?",
                 options: ["Flashbangs over Mid", "Smokes on Market Door and Market Window", "HE Grenades on Van", "Incendiaries on Mid"],
                 correctAnswer: "Smokes on Market Door and Market Window"),

    QuizQuestion(question: "Where should a Molotov be placed to disrupt CT defenders?",
                 options: ["Catwalk", "Market", "Van", "Apartments"],
                 correctAnswer: "Van"),

    QuizQuestion(question: "What is a common mistake while executing this strategy?",
                 options: ["Entering B Site before Mid players are ready", "Using Flashes before Smokes", "Taking too much time to execute", "All of the above"],
                 correctAnswer: "Entering B Site before Mid players are ready"),

    QuizQuestion(question: "How can the CTs counter this tactic?",
                 options: ["By stacking A Site", "By pushing Mid aggressively before the execute", "By playing passively on B", "By rushing T-Spawn"],
                 correctAnswer: "By pushing Mid aggressively before the execute"),

    QuizQuestion(question: "Why is this tactic stronger than a normal B rush?",
                 options: ["It allows a pincer attack from two sides", "It doesn’t require utility", "It is slower and more methodical", "It relies on luck"],
                 correctAnswer: "It allows a pincer attack from two sides"),

    QuizQuestion(question: "Where should the bomb be planted for a strong post-plant?",
                 options: ["Default", "Close to Apartments", "Open for Catwalk and Apartments", "Inside Market"],
                 correctAnswer: "Open for Catwalk and Apartments")
]

