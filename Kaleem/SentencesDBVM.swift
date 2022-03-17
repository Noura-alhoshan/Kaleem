//
//  SentencesDBVM.swift
//  Kaleem
//
//  Created by نوره سعد on 13/08/1443 AH.
//

//import Foundation
//import SwiftUI
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//class SentencesDBVM: ObservableObject {
//   // @Published var sentences = [Sentence] ()
//
//    private var db = Firestore.firestore()
//
//    func fetchData() {
//     db.collection ("books").addSnapshotListener { (querySnapshot, error) in
//        guard let documents = querySnapshot?. documents else {
//          print("No documents")
//            return}
//
//         documents.compactMap { (queryDocumentSnapshot) → Book?; in self.books =
//         return try? queryDocumentSnapshot.data(as: Book.self)
//
//         }
//     }
//    }
//}

import Foundation
import Firebase
//import FirebaseFirestoreSwift
class SentencesDBVM: ObservableObject {
    let db = Firestore.firestore()
    //@Published var myQuiz1: [QuestionModel] = []
    @Published var docs3 : [DocSentences] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var category = ""


    init() {
           Task.init {
               await fetchData()
               print(docs3.count)
           }
       }
    
    func fetchData() async {
        do{
            DispatchQueue.main.async {
                
                self.db.collection("testNoura").getDocuments { (snap, err) in
                           DispatchQueue.main.async {
                               if err != nil {
                                   print((err?.localizedDescription)!)
                                   //completion(.failure(err!))
                                   return
                               } else {
                                  // var users = [User]()
                                   for i in snap!.documents{
                                       
                                      let data = i.data()
                                      let category = data["category"] as? String ?? ""
                                       
                                       self.docs3.append(DocSentences( category: category))
                                   }
                               }
                               self.length = self.docs3.count
                                                    self.setSentences()
        
//                self.db.collection("LocationSentences").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return}
//
//
//
//
//            self.docs3 = documents.compactMap { (queryDocumentSnapshot) -> DocSentences? in
//
//
//
//                return try? queryDocumentSnapshot.data(as: DocSentences.self)
//
                
            }
        }
            }
        }
    }
        
    
    func setSentences() {
     
          print("setSentences")
            for sentences in docs3 {
              let currentCategory = sentences
              category = currentCategory.category
          }
      }
      
    
    
    
    
    
//        for i in self.docs3{
//        if i.category == "cafe" {
//
//            for sentencesArray in i.sentencesArray {
//                print("\(sentencesArray)")
//            }
//
//        }
//
//        }
        
    
    
 func   printFetching(){
     
     
    //    let querySnapshot = fetchData()
     
    
     
//     for i in querySnapshot {
//
//         print(self.querySnapshot[i].["sentences"][0])
//
//     }
        
    }
    
    
}
    
    
    
    




//private func fetchBook(documentId: String) {
//  let docRef = db.collection("books").document(documentId)
//
//  docRef.getDocument(as: Book.self) { result in
//    switch result {
//    case .success(let book):
//      // A Book value was successfully initialized from the DocumentSnapshot.
//      self.book = book
//      self.errorMessage = nil
//    case .failure(let error):
//      // A Book value could not be initialized from the DocumentSnapshot.
//      self.errorMessage = "Error decoding document: \(error.localizedDescription)"
//    }
//  }
//}
