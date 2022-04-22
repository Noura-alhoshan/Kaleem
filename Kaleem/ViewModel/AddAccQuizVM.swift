//
//  AddAccQuizVM.swift
//  Kaleem
//
//  Created by Sarah S on 22/07/1443 AH.
//


//************************* This is to browse and fetch all question in acceptance & educational quiz ****************************


import Foundation
import FirebaseFirestore

class ContactViewModel: ObservableObject {
    
    @Published var questions = [QuestionModel]()
    @Published var oneQuestion: QuestionModel = QuestionModel(Qid: "-", question: "-", correctAnswer: ".", questionText: "-", answers: [QuestionModel.Answer (id: UUID() , text: "-", isCorrect:  false),
                                          QuestionModel.Answer (id: UUID() , text: "-", isCorrect:  false),
                                          QuestionModel.Answer (id: UUID() , text: "-", isCorrect:  false),
                                          QuestionModel.Answer (id: UUID() , text: "-", isCorrect:  false)])//this is just temp
    
    
    
    private var db = Firestore.firestore()
    var docID = ""//CAN NOT BE PRIVATE 
    
    func fetchData(quizCollection: String) {//"AcceptanceQuiz"
        db.collection(quizCollection).addSnapshotListener { (querySnapshot, error) in
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

                let a1 = QuestionModel.Answer (id: UUID() , text: answer1, isCorrect: answer1 == correctA ? true: false)
                let a2 = QuestionModel.Answer (id: UUID() , text: answer2, isCorrect: answer2 == correctA ? true: false)
                let a3 = QuestionModel.Answer (id: UUID() , text: answer3, isCorrect: answer3 == correctA ? true: false)
                let a4 = QuestionModel.Answer (id: UUID() , text: answer4, isCorrect: answer4 == correctA ? true: false)
                
                return QuestionModel( Qid: questionID, question: question, correctAnswer: correctA, questionText: questionText, answers: [a1,a2,a3,a4])
            }
        }
    }
    
    //fetch one question by id
    func fetchQuestion(Qid: String, quizCollection: String ) {
            db.collection(quizCollection).document(Qid).getDocument { (document, error) in
                if let document = document, document.exists {
                    self.oneQuestion.question = document["question"] as? String ?? ""
                    self.oneQuestion.questionText = document["questionText"] as? String ?? ""
                    self.oneQuestion.correctAnswer = document["correctAnswer"] as? String ?? ""
                    self.oneQuestion.answers[0].text = document["answer1"] as? String ?? ""
                    self.oneQuestion.answers[1].text = document["answer2"] as? String ?? ""
                    self.oneQuestion.answers[2].text = document["answer3"] as? String ?? ""
                    self.oneQuestion.answers[3].text = document["answer4"] as? String ?? ""
                    self.oneQuestion.Qid = document.documentID

                } else {
                    print("Document does not exist")

                     }
            }
        }
    
    
    
}


