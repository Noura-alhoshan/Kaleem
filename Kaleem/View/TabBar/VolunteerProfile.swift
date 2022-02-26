//
//  VolunteerProfile.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 23/07/1443 AH.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct VolunteerProfile: View {
    @EnvironmentObject var session: SessionStore
  
   
    var body: some View {
        
        VStack{
            Text("Hello Volunteer!")

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

struct VolunteerProfile_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerProfile()
    }
}
