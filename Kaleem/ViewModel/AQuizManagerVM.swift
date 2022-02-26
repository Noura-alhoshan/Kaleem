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

class AQuizManagerVM: ObservableObject {
    let db = Firestore.firestore() 
    // Variables to set attributes of quiz
    @Published var myQuiz1: [QuestionModel] = []
var h = 0
    
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var question = ""
    @Published private(set) var answerChoices: [QuestionModel.Answer] = []
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
                
                self.db.collection("AcceptanceQuiz").getDocuments { (snap, err) in
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
                                let questionText = data["questionText"] as? String ?? ""
                                let answer1 = data["answer1"] as? String ?? ""
                                let answer2 = data["answer2"] as? String ?? ""
                                let answer3 = data["answer3"] as? String ?? ""
                                let answer4 = data["answer4"] as? String ?? ""


                                //    print(self.datas[i].name)
                                                                
                                self.myQuiz1.append(QuestionModel( question: question, correctAnswer: correctAnswer,questionText: questionText, answers: [
                                    QuestionModel.Answer(text: "أ. "+answer1, isCorrect: answer1.elementsEqual(correctAnswer) ),
                                    QuestionModel.Answer(text: "ب. "+answer2, isCorrect: answer2.elementsEqual(correctAnswer) ),
                                    QuestionModel.Answer(text: "ج. "+answer3, isCorrect: answer3.elementsEqual(correctAnswer) ),
                                    QuestionModel.Answer(text:"د. "+answer4, isCorrect: answer4.elementsEqual(correctAnswer) ),
                                    
                                ]))
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
    
    func selectAnswer(answer: QuestionModel.Answer) {
        answerSelected = true
        
        if answer.isCorrect {
            score += 1
        }
    }
}
//*/
