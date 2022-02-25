//
//  SessionStore.swift
//  Kaleem
//
//  Created by Sarah S on 24/06/1443 AH.
//

import Foundation
import SwiftUI
import Combine
import Firebase

class User {
    var uid: String
    var email: String?

    init(uid: String,  email: String?) {
        self.uid = uid
        self.email = email
    }
    
    

}



class SessionStore : ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    var session: User? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    let authh = Auth.auth()
    let db = Firestore.firestore()

    @Published var UserType: String = ""
    @Published var signedIn = false
    @Published var isError = false
    
    var isSignedIn: Bool {
        return authh.currentUser != nil
    }
    
    
    //To know if user signed in or not
    func signInStraem(email: String, password: String)
    {
            DispatchQueue.main.async {
                self.signedIn = true
                self.isError = false
               // self.listen()
             
            }
//        print("self.UserType")
//        print(self.UserType)
    }
    
    
    //To sign in the right user (control errors)
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        
    }

   
    func signOut(){
       try? authh.signOut()
        
        self.signedIn = false
        self.UserType = ""
    }
    
    
    //To monitor authentication changes using firebase
    func listen () {
           handle = Auth.auth().addStateDidChangeListener { (auth, user) in
               if let user = user {
                   // if we have a user, create a new user model
                   
                   self.session = User(
                       uid: user.uid,
                       email: user.email
                       
                   )
                   print("Got user: \(user.uid)")
                  
                   self.getUserType(userid: user.uid)//✅✅✅ To record the user type in UserType variable
                   
               } else {
                   self.session = nil
               }
           }
   
       }
    
    
   
    //To get user's type from DB
    func getUserType(userid: String) {
        let docRef = db.collection("Volunteer").document(userid)
        
        docRef.getDocument { (document, error) in 
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                self.UserType = document["Type"] as! String 
                print("Document data: \(dataDescription)")
               
            } else {
                print("Document does not exist")
                 }
        }
        
        
        if (self.UserType == "")
        {
            db.collection("Speech-impaired").document(userid)
            .getDocument { (document, error) in
                if let document = document, document.exists {
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    self.UserType = document["Type"] as! String
                    print("Document data: \(dataDescription)")
                } else {
                    print("Document does not exist")
                     }
            }
        }
        
        if (self.UserType == "")
        {
            db.collection("Admin").document(userid)
            .getDocument { (document, error) in
                if let document = document, document.exists {
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    self.UserType = document["Type"] as! String
                    print("Document data: \(dataDescription)")
                } else {
                    print("Document does not exist")
                     }
            }
        }
        
    }
    


    
}//end of class
