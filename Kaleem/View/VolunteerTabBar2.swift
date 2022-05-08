//
//  VolunteerTabBar2.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 16/08/1443 AH.
//

import SwiftUI
struct VolunteerTabBar2: View {
    @State private var selected = 1
    var body: some View {
        
        TabView (selection: $selected){
            
            ProfileView().navigationBarHidden(true)
                .tag(0)
                         .tabItem {
                      Image (systemName: "person")
                      Text("حسابك")
                         }

                     
               
            //change it to voulnteer home
            VolunteerHome().navigationBarHidden(true)
                .tag(1)
                    .tabItem {
                         Image(systemName: "house")
                        Text("الرئيسية")
                        
                    }
    
}
        .accentColor((Color("Color")))
        
        
        
        
    
    }
}
