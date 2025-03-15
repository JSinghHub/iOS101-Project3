//
//  TriviaQuestions.swift
//  Trivia
//
//  Created by Jaskirat Singh on 3/14/25.
//

import Foundation

struct TriviaQuestion {
  let text: String
  let category: String
  let answers: [String]
  let correctAnswerIndex: Int
}

struct TriviaQuestions {
  let questions: [TriviaQuestion]

  init() {
    // Mock Data
    questions = [
    TriviaQuestion(text: "Who played the character Harry Potter in the film series?", category: "Entertainment", answers: ["Emma Watson", "Rupert Grint", "Tom Felton", "Daniel Radcliffe"], correctAnswerIndex: 3),
    TriviaQuestion(text: "What is the capital of Australia?", category: "Geography", answers: ["Sydney", "Canberra", "Melbourne", "Brisbane"], correctAnswerIndex: 1),
    TriviaQuestion(text: "Which planet is known as the Red Planet?", category: "Astronomy", answers: ["Earth", "Mars", "Venus", "Jupiter"], correctAnswerIndex: 1)
    ]
  }
}
