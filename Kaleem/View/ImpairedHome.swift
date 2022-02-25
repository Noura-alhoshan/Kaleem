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
    @State var showVideCall: Bool = false
    
   
    var body: some View {
        
        VStack{
            Text("Hello Impaired!")
            
            NavigationLink(destination: VideoCallV(), isActive: $showVideCall, label: {EmptyView()} )

            /*Calling function*/
            Button( action: {
                self.showVideCall = true
             /*   if let yourURL = URL(string: "facetime://0550804411") {
                    UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                }*/

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
        
   
    }// end body
} //end view

struct ImpairedHome_Previews: PreviewProvider {
    static var previews: some View {
        ImpairedHome()
    }
}
