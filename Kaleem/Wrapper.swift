//
//  ContentView.swift
//  Shared
//
//  Created by Sara S on 19/06/1443 AH.
//

import SwiftUI

//let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

//let storedUsername = "Farukh"
//let storedpassword = "abcabc"

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser () {
          session.listen()
      }
    
   
    
    var body: some View {
        
        Group {
            if (session.session != nil) {
               Text("Home")//home screen
             
            }
            else {
               SignInForm()
            }
        

        }.onAppear(perform: getUser)
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
    }
}
#endif
///
