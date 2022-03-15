//
//  AddAccQuizVM.swift
//  Kaleem
//
//  Created by Sarah S on 22/07/1443 AH.
//


//************************* This is to browse and fetch all question in acceptance quiz ****************************


import Foundation
import FirebaseFirestore
import SwiftUI
import Firebase

class ProfileVM: ObservableObject {
    
    @Published var KaleemUser: Volunteer = Volunteer(name: "-", phoneNo: "-", email: "-")
    let authh = Auth.auth()
    
    private var db = Firestore.firestore()
  
    func fetchUser() {
        
        db.collection("Speech-impaired").document(Auth.auth().currentUser!.uid)
        .getDocument { (document, error) in
            if let document = document, document.exists {
                self.KaleemUser.name = document["name"] as? String ?? ""
                self.KaleemUser.email = document["email"] as? String ?? ""
                self.KaleemUser.phoneNo = document["phoneNo"] as? String ?? ""
            }
            else {
                self.db.collection("Volunteer").document(Auth.auth().currentUser!.uid)
                .getDocument { (document, error) in
                    if let document = document, document.exists {
                        self.KaleemUser.name = document["name"] as? String ?? ""
                        self.KaleemUser.email = document["email"] as? String ?? ""
                        self.KaleemUser.phoneNo = document["phoneNo"] as? String ?? ""
                        print(self.KaleemUser.name)
                 }
               }
            }
        
        }
      
    }//end of method
    
   
    
}


