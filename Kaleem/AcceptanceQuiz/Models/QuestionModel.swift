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
//    var answer1: String
//    var answer2: String
//    var answer3: String
//    var answer4: String

    var answers: [Answer]
    
    struct Answer: Identifiable {
        var id: UUID = UUID()
        var text: String
        var isCorrect: Bool
    }
}

//struct QuizModel  {
//    var id: UUID {
//        UUID()
//    }
//    var question: String?
//    var correctAnswer: String?
//    var incorrectAnswers: [String]
//
//}
//
////final quiz is an array of quizmodel\
//var myQuiz1 = [QuizModel]()

//: [QuizModel] =
