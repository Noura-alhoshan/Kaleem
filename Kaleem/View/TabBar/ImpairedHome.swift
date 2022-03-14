////
////  Home.swift
////  Kaleem
////
////  Created by Sarah S on 24/06/1443 AH.
////
//
//import SwiftUI
//import FirebaseAuth
//import Firebase
//
//struct ImpairedHome: View {
//    @EnvironmentObject var session: SessionStore
//  @State var selectedTab = "house"
//
//    var body: some View {
//    
//
////        VStack(){
////
////            Text("Hello Impaired!")
////
////        Button(action: {
////            session.signOut()
////        }, label: {
////            Text("تسجيل الخروج")
////                .font(.headline)
////                .foregroundColor(.white)
////                .padding()
////                .frame(width: 220, height: 60)
////                .background(Color.black)
////                .cornerRadius(35.0)
////        })
////
////            ImpairedNavBar()}
//
//        ZStack(alignment: .bottom, content: {
//            Color.white
//                .ignoresSafeArea()
//           // Custom Tab Bar....
//            ImpairedTabBar(selectedTab: $selectedTab)
//        })
//
//
//
//         }
//
//
//
//
//
//
//
//
//
//    }
//
//
//
//
//struct ImpairedHome_Previews: PreviewProvider {
//    static var previews: some View {
//        ImpairedHome()
//    }
//}
