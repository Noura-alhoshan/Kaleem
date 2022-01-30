//
//
//  
//  Created by Sarah S on 19/06/1443 AH.
//

import SwiftUI


struct Wrraper: View{
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        NavigationView{
            if session.signedIn{
                Home()
            
            }
            else{
                SignInForm()
            }
        }.onAppear {session.signedIn = session.isSignedIn}
    }
}
