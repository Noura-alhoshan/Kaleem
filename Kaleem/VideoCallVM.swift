//
//  VideoCallVM.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 24/07/1443 AH.
//

/* This is the file where we retrive volunteers list to make video call*/
import Foundation
import FirebaseFirestore

class VideoCallVM: ObservableObject {
    
    @Published var volunteers = [Volunteer]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("Volunteer").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.volunteers = documents.map { (queryDocumentSnapshot) -> Volunteer in
                let data = queryDocumentSnapshot.data()
                let username = data ["username"] as? String ?? "" /*WE NEED TO CHANGE IT TO NAME!*/
                let phoneNo = data["phoneNo"] as? String ?? ""
                return Volunteer(username: username, phoneNo: phoneNo)
            }
        }
    }
}
