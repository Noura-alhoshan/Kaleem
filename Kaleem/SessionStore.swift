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
   // var displayName: String?

    init(uid: String,  email: String?) {
        self.uid = uid
        self.email = email
        //self.displayName = displayName
    }
    
    

}



class SessionStore : ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    var session: User? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    let authh = Auth.auth()

    @Published var signedIn = false
    @Published var isError = false
    
    var isSignedIn: Bool {
        return authh.currentUser != nil
    }
    
    //this is to know if user signed in or not
    func signInStraem(email: String, password: String)
    {
//        authh.signIn(withEmail: email, password: password){ [weak self]
//            result,error in guard result != nil,error == nil else {
//                return
//            }
            
            DispatchQueue.main.async {
                self.signedIn = true
                self.isError = false
            }
            
        //}
    }
    
    
    //this is to sign in the right user (control errors)
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
    }
    
    func listen () {
           // monitor authentication changes using firebase
           handle = Auth.auth().addStateDidChangeListener { (auth, user) in
               if let user = user {
                   // if we have a user, create a new user model
                   print("Got user: \(user)")
                   self.session = User(
                       uid: user.uid,
                       //displayName: user.displayName
                       email: user.email
                       
                   )
               } else {
                   // if we don't have a user, set our session to nil
                   self.session = nil
               }
           }
       }
   
    
//
//    func unbind () {
//            if let handle = handle {
//                Auth.auth().removeStateDidChangeListener(handle)
//            }
//        }
}




   
