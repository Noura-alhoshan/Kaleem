
//
//  VideoCallVM.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 15/08/1443 AH.
//

import Foundation
import SwiftUI
import FirebaseAuth
import Firebase

class VideoCallVM: ObservableObject {
    private var db = Firestore.firestore()
   // @State var currentV =  Volunteer()
 
 //   @Published var volunteers = [Volunteer]()
    
    
  /*
    func fetchData() {
        db.collection("Volunteer").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.volunteers = documents.map { (queryDocumentSnapshot) -> Volunteer in
                queryDocumentSnapshot.
//                data.
                return Volunteer(username: username, phoneNo: phoneNo)
            }
        }
    }*/
    
    
    func updateVolunteerCallStatus() {
       
       // Add a document to a collection
      //  db.collection(/*userType*/"Volunteer").addDocument(data: ["uid":uid/*, "username":username, "phoneNo":phone, "email":email*/])
        // Add a document to a collection
        db.collection("Volunteer").getDocuments(){
            (snapshot, err) in
            if let err = err {
                print("ERROR IN S_HOME updateVolunteerCallStatus() Method")
            }
            else {
                for doc in snapshot!.documents {
                    self.db.collection("Volunteer").document(doc.documentID).updateData(["status":"ringing"])
                    print(doc.documentID)
                }
            }
        }
        }
    
//    func updateVolunteerCallStatus2(){
//        db.collection("Volunteer").document(currentV.id).getDocument {
//            (snapshot, err) in
//            if let err = err {
//                print("ERROR IN S_HOME updateVolunteerCallStatus() Method")
//            }
//            else{
//                print("Wll don1!!!!!:\(self.currentV.id)")
//
//}
//          
//        }
//    }
}
   

//
