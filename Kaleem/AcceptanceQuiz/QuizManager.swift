//
//  QuizManager.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    // Variables to set attributes of quiz
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var question = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    
    init() {
        Task.init {
            await fetchQuiz()
        }
    }
    
    func fetchQuiz() async {
        do {
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                self.length = myQuiz1.count
                self.setQuestion()
            }
        }
    }
    
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    

    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)
        if index < length {
            let currentQuizQuestion = myQuiz1[index]
            question = currentQuizQuestion.question!
            answerChoices = currentQuizQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        if answer.isCorrect {
            score += 1
        }
    }
}
//*/
