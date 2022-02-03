//
//  QuizManager.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import Foundation
import SwiftUI
import Firebase

class QuizManager: ObservableObject {
    let db = Firestore.firestore()
    // Variables to set attributes of quiz
    @Published var myQuiz1: [QuestionModel] = []
    @Published var test: [User] = []
var h = 0
    
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
            print(myQuiz1.count)
        }
    }
    
    func fetchQuiz() async {
        do {
            DispatchQueue.main.async {
                
                self.db.collection("items").getDocuments { (snap, err) in
                    DispatchQueue.main.async {
                        if err != nil {
                            print((err?.localizedDescription)!)
                            //completion(.failure(err!))
                            return
                        } else {
                           // var users = [User]()
                            for i in snap!.documents{
                                
                                let data = i.data()
                                let question = data["question"] as? String ?? ""
                                let correctAnswer = data["correctAnswer"] as? String ?? ""
                                let text = data["text"] as? String ?? ""

                                //    print(self.datas[i].name)
                                
                                print("hello2")
                                
                                self.myQuiz1.append(QuestionModel( question: question, correctAnswer: correctAnswer,answers: [Answer(text: text, isCorrect: true )]))
                                 print(self.myQuiz1[self.h].question)
                                //Answer(text: $0["text"] as! String
                                self.h = self.h+1
                                
                            }
                            //completion(.success(users))
                        }
                        self.index = 0
                        self.score = 0
                        self.progress = 0.00
                        self.reachedEnd = false
                        self.length = self.myQuiz1.count
                        self.setQuestion()
                    }
                }
                
      
            }
        }
    }
    
    func fetchQuizRestart() async {
   
                        self.index = 0
                        self.score = 0
                        self.progress = 0.00
                        self.reachedEnd = false
                        self.length = self.myQuiz1.count
                        self.setQuestion()
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
   
        print("setQuestion")

        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)
        if index < length {
            let currentQuizQuestion = myQuiz1[index]
            question = currentQuizQuestion.question
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
