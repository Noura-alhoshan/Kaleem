//
//  QuestionsModel.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//

import Foundation

struct QuestionModel: Identifiable {
    var id: UUID = UUID()
    var question: String
    var correctAnswer: String
    var answers: [Answer]
    
    struct Answer: Identifiable {
        var id: UUID = UUID()
        var text: String
        var isCorrect: Bool
    }
}
