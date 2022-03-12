//
//  ImpairedProfile.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 23/07/1443 AH.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct ImpairedProfile: View {
    @EnvironmentObject var session: SessionStore
<<<<<<< HEAD:Kaleem/View/TabBar/ImpairedProfile.swift
   
=======
    @Environment(\.openURL) private var openURL
    @State var showVideCall: Bool = false
    
>>>>>>> Stage:Kaleem/View/ImpairedHome.swift
   
    var body: some View {
        
        VStack{
            Text("Hello Impaired!")
<<<<<<< HEAD:Kaleem/View/TabBar/ImpairedProfile.swift

=======
            
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
            
>>>>>>> Stage:Kaleem/View/ImpairedHome.swift
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
<<<<<<< HEAD:Kaleem/View/TabBar/ImpairedProfile.swift
        }
    
        
      
    }
}
=======
        } //Text("looooong time").bold() /VStack end
        
   
    }// end body
} //end view
>>>>>>> Stage:Kaleem/View/ImpairedHome.swift

struct ImpairedProfile_Previews: PreviewProvider {
    static var previews: some View {
        ImpairedProfile()
    }
}
