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
    @State var showAccQuiz: Bool = false
   
    var body: some View {
        
        VStack{
            
            NavigationLink(destination:TextToSpeechV(), isActive: $showAccQuiz, label: {EmptyView()} )

            Text("Hello impaired!")
       
            Button(action: {
                //AddAccQuizV()
                showAccQuiz = true
            }, label: {
                Text("trans ")
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
        }
    }
}
struct ImpairedHome_Previews: PreviewProvider {
    static var previews: some View {
        ImpairedHome()
    }
}
