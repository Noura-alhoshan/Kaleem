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
    @State var showProfile: Bool = false
    @ObservedObject private var PViewModel = ProfileVM()
 
    var body: some View {
        
       
        
        VStack{
            NavigationLink(destination: ProfileView(), isActive: $showProfile, label: {EmptyView()} )

            Text("Hello Volunteer!")
            
            Button(action: {
              //  PViewModel.fetchUser()
                showProfile = true
            }, label: {
                Text("profile ")
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
        } //Text("looooong time").bold()
    }
}

