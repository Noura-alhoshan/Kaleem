//
//  Home.swift
//  Kaleem
//
//  Created by Sarah S on 24/06/1443 AH.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct ImpairedHome: View {
    @EnvironmentObject var session: SessionStore
    @Environment(\.openURL) private var openURL
    @State var showProfile: Bool = false
    @State var VM = VideoCallVM()

   
    var body: some View {
        
        NavigationView{
        VStack{
            Text("Hello Impaired!")
            NavigationLink(destination: TextToSpeechV(), isActive: $showProfile, label: {EmptyView()} ).navigationBarTitle("", displayMode: .inline).navigationBarHidden(true)

            /*Calling function*/
            Button( action: {
                VM.updateVolunteerCallStatus()
                //self.showVideCall = true
             /*   if let yourURL = URL(string: "facetime://0550804411") {
                    UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                }*/
                /// change status of all volunteers to ringing 

            } , label: {
                Text("اتصل")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.black)
                    .cornerRadius(35.0)
            })
            
            Button(action: {
               showProfile = true
            }, label: {
                Text("translate ")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.black)
                    .cornerRadius(35.0)
            })
            
            
        Button(action: {
            session.signOut()
        }, label: {
            Text("تسجيل الخروج")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.black)
                .cornerRadius(35.0)
        })
        } //Text("looooong time").bold() /VStack end
        
    }
    }// end body
} //end view

struct ImpairedHome_Previews: PreviewProvider {
    static var previews: some View {
        ImpairedHome()
    }
}

import FirebaseFirestore

class VideoCallVM: ObservableObject {
    private var db = Firestore.firestore()

 
    @Published var volunteers = [Volunteer]()
    
    
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
}
   

//
