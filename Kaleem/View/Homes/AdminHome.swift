//
//  Home.swift
//  Kaleem
//
//  Created by Sarah S on 24/06/1443 AH.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct AdminHome: View {
    @EnvironmentObject var session: SessionStore
    @State var selectedTab = "house"
   
    var body: some View {
        
//        VStack{
//            Text("Hello Admin!")
//
//        Button(action: {
//            session.signOut()
//        }, label: {
//            Text("تسجيل الخروج")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .frame(width: 220, height: 60)
//                .background(Color.black)
//                .cornerRadius(35.0)
//        })
//        }
        
        ZStack(alignment: .bottom, content: {
            Color.white
                .ignoresSafeArea()
           // Custom Tab Bar....
            AdminTabBar(selectedTab: $selectedTab)
        })
        
   
    }
}

struct AdminHome_Previews: PreviewProvider {
    static var previews: some View {
        AdminHome()
    }
}
