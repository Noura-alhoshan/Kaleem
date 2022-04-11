//
//
//  
//  Created by Sarah S on 19/06/1443 AH.
//

import SwiftUI
import Firebase

struct Wrraper: View{
    @EnvironmentObject var session: SessionStore

    var body: some View {
        
        NavigationView{
           
            if !session.signedIn{
               // SignIn()
                ContentView()
            }
            else{
                switch session.UserType
                {
                case "Volunteer":
                    VolunteerHome()
                    
                case "Impaired":
                  //  ImpairedHome()
                    ImpairedTabBar2()
                    
                case "Admin":
                    Admin2Home()
                    
                default:
                   ProgressView()
                   //AdminHome()
                }
                
            }
        }.onAppear {
            session.signedIn = session.isSignedIn;
            session.listen();
        }//✅✅✅ very important to solve infinite indicator problem
    }
}
