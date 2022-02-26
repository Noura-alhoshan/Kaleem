//
//  AddAccQuizVM.swift
//  Kaleem
//
//  Created by Sarah S on 22/07/1443 AH.
//

import Foundation
import FirebaseFirestore

class ContactViewModel: ObservableObject {
    
    @Published var contacts = [QuestionModel]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("AcceptanceQuiz").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.contacts = documents.map { (queryDocumentSnapshot) -> QuestionModel in
                let data = queryDocumentSnapshot.data()
                let question = data["question"] as? String ?? ""
                let questionText = data["questionText"] as? String ?? ""
                let correctA = data["correctAnswer"] as? String ?? ""
                let answer1 = data["answer1"] as? String ?? ""
                let answer2 = data["answer2"] as? String ?? ""
                let answer3 = data["answer3"] as? String ?? ""
                let answer4 = data["answer4"] as? String ?? ""
                
               // let identifier = UUID()
                
                let a1 = QuestionModel.Answer (id: UUID() , text: answer1, isCorrect: answer1 == correctA ? true: false)
                let a2 = QuestionModel.Answer (id: UUID() , text: answer2, isCorrect: answer2 == correctA ? true: false)
                let a3 = QuestionModel.Answer (id: UUID() , text: answer3, isCorrect: answer3 == correctA ? true: false)
                let a4 = QuestionModel.Answer (id: UUID() , text: answer4, isCorrect: answer4 == correctA ? true: false)
                
                return QuestionModel(question: question, correctAnswer: correctA, questionText: questionText, answers: [a1,a2,a3,a4])
            }
        }
    }
}
