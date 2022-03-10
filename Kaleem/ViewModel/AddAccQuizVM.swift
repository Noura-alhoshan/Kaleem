//
//  AddAccQuizVM.swift
//  Kaleem
//
//  Created by Sarah S on 22/07/1443 AH.
//


//************************* This is to browse all question in acceptance quiz ****************************


import Foundation
import FirebaseFirestore

class ContactViewModel: ObservableObject {
    
    @Published var questions = [QuestionModel]()
    @Published var oneQuestion: QuestionModel = QuestionModel(Qid: "whatever", question: "String", correctAnswer: "correct", questionText: "String", answers: [QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
                                          QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
                                          QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
                                          QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true)])//this is just temp
    
    
    
    private var db = Firestore.firestore()
    var docID = ""
    
    func fetchData() {
        db.collection("AcceptanceQuiz").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                
                return
            }
            
            self.questions = documents.map { (queryDocumentSnapshot) -> QuestionModel in
                let data = queryDocumentSnapshot.data()
                let question = data["question"] as? String ?? ""
                let questionText = data["questionText"] as? String ?? ""
                let correctA = data["correctAnswer"] as? String ?? ""
                let answer1 = data["answer1"] as? String ?? ""
                let answer2 = data["answer2"] as? String ?? ""
                let answer3 = data["answer3"] as? String ?? ""
                let answer4 = data["answer4"] as? String ?? ""
                let questionID = queryDocumentSnapshot.documentID
                //docID = documents.documentID
               // let identifier = UUID()
                
                let a1 = QuestionModel.Answer (id: UUID() , text: answer1, isCorrect: answer1 == correctA ? true: false)
                let a2 = QuestionModel.Answer (id: UUID() , text: answer2, isCorrect: answer2 == correctA ? true: false)
                let a3 = QuestionModel.Answer (id: UUID() , text: answer3, isCorrect: answer3 == correctA ? true: false)
                let a4 = QuestionModel.Answer (id: UUID() , text: answer4, isCorrect: answer4 == correctA ? true: false)
                
                return QuestionModel( Qid: questionID, question: question, correctAnswer: correctA, questionText: questionText, answers: [a1,a2,a3,a4])
            }
        }
    }
    
    
    func fetchQuestion(Qid: String ) {
       // db.collection("AcceptanceQuiz").addSnapshotListener { (querySnapshot, error) in
            db.collection("AcceptanceQuiz").document(Qid).getDocument { (document, error) in
                if let document = document, document.exists {
                   // let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    self.oneQuestion.question = document["question"] as? String ?? ""
                    self.oneQuestion.questionText = document["questionText"] as? String ?? ""
                    self.oneQuestion.correctAnswer = document["correctAnswer"] as? String ?? ""
                    self.oneQuestion.answers[0].text = document["answer1"] as? String ?? ""
                    self.oneQuestion.answers[1].text = document["answer2"] as? String ?? ""
                    self.oneQuestion.answers[2].text = document["answer3"] as? String ?? ""
                    self.oneQuestion.answers[3].text = document["answer4"] as? String ?? ""
                    self.oneQuestion.Qid = document.documentID
                    //docID = documents.documentID
                   // let identifier = UUID()
                    
                    //return QuestionModel( Qid: questionID, question: question, correctAnswer: correctA, questionText: questionText, answers: [a1,a2,a3,a4])
                    //print("Document data: \(dataDescription)")
                } else {
                    print("Document does not exist")
                    //return
                     }
            
             //   print("No documents")
                
             //   return
           // }
                
               
            }
        }
    
    
    
}


