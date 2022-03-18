////
////  SentencesDBVM.swift
////  Kaleem
////
////  Created by Raneem AlRashoud on 09/08/1443 AH.
////
//
////import Foundation
////import SwiftUI
////import FirebaseFirestore
////import FirebaseFirestoreSwift
////
////class SentencesDBVM: ObservableObject {
////   // @Published var sentences = [Sentence] ()
////
////    private var db = Firestore.firestore()
////
////    func fetchData() {
////     db.collection ("books").addSnapshotListener { (querySnapshot, error) in
////        guard let documents = querySnapshot?. documents else {
////          print("No documents")
////            return}
////
////         documents.compactMap { (queryDocumentSnapshot) → Book?; in self.books =
////         return try? queryDocumentSnapshot.data(as: Book.self)
////
////         }
////     }
////    }
////}
//
//
//import Foundation
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//class SentencesDBVM: ObservableObject {
//
// @Published var docs3 = [DocSentences] ()
// private var db = Firestore.firestore()
//    
//    
//    func fetchData() {
//        db.collection("LocationSentences").addSnapshotListener { (querySnapshot, error) in
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
//                
//            }
//        }
//        
////        for i in self.docs3{
////        if i.category == "cafe" {
////       
////            for sentencesArray in i.sentencesArray {
////                print("\(sentencesArray)")
////            }
////            
////        }
////        
////        }
//        
//    }
//    
// func   printFetching(){
//     
//     
//    //    let querySnapshot = fetchData()
//     
//    
//     
////     for i in querySnapshot {
////
////         print(self.querySnapshot[i].["sentences"][0])
////
////     }
//        
//    }
//    
//    
//
//    
//    
//    
//    
//}
//
//
//
////private func fetchBook(documentId: String) {
////  let docRef = db.collection("books").document(documentId)
////
////  docRef.getDocument(as: Book.self) { result in
////    switch result {
////    case .success(let book):
////      // A Book value was successfully initialized from the DocumentSnapshot.
////      self.book = book
////      self.errorMessage = nil
////    case .failure(let error):
////      // A Book value could not be initialized from the DocumentSnapshot.
////      self.errorMessage = "Error decoding document: \(error.localizedDescription)"
////    }
////  }
////}
