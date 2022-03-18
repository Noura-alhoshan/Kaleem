//
//  Home.swift
//  Kaleem
//
//  Created by Sarah S on 24/06/1443 AH.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SignOut: View {
    @EnvironmentObject var session: SessionStore
 
    var body: some View {
 
        HStack {
         
                    
           
                      //  Spacer()
                        
                        
                        Button(action: {
                            
                            session.signOut()
                        }, label: {
                            
                            
                                   Image(systemName: "arrow.up.right.circle.fill")
                                 
                                       .font(.system(size: 45))
                                       .foregroundColor(Color("Color"))
                            
                        })
            
            
         
           

                    

        }
        
        
            

//
    
      
    }// end body
} //end view

struct SignOut_Previews: PreviewProvider {
    static var previews: some View {
        SignOut()
    }
}

