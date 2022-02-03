//
//  VolunteerHome.swift
//  Kaleem
//
//  Created by Sarah S on 24/06/1443 AH.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct VolunteerHome: View {
    @EnvironmentObject var session: SessionStore
    
   
    var body: some View {
        
     
        
     //   let curUser =  self.session.session?.uid ?? " "
        
        VStack{
            Text("Hello Volunteer!")
            
            //if (self.session.session?.uid != nil)
//            Text(curUser)
//           // Print(User.uid)
//
//            Button(action: {
//                call()
//            }, label: {
//                Text("تسجيل ")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 220, height: 60)
//                    .background(Color.black)
//                    .cornerRadius(35.0)
//            })
//
//            Text(UserType)
//
            
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
        } //Text("looooong time").bold()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerHome()
    }
}
