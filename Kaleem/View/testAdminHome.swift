//
//  Home.swift
//  Kaleem
//
//  Created by Sarah S on 24/06/1443 AH.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct Admin2Home: View {
    @EnvironmentObject var session: SessionStore
    @State var showAccQuiz: Bool = false
   
    var body: some View {
        
        VStack{
            
            NavigationLink(destination: BrowseAccQuizV(), isActive: $showAccQuiz, label: {EmptyView()} )

            Text("Hello Admin!")
       
            Button(action: {
                //AddAccQuizV()
                showAccQuiz = true
            }, label: {
                Text("اختبار القبول")
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

struct Admin2Home_Previews: PreviewProvider {
    static var previews: some View {
        Admin2Home()
    }
}
