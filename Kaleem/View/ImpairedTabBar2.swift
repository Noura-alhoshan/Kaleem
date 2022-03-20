//
//  ImpairedTabBar2.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 16/08/1443 AH.
//
import SwiftUI
struct ImpairedTabBar2: View {
    
    var body: some View {
        
        TabView {
            
            ProfileView()
                         .tabItem {
                      Image (systemName: "person")
                      Text("حسابك")
                         }
            

            
            Translation()
           // NoLocation()
                        .tabItem {
                     Image (systemName: "hand.raised")
                     Text("الترجمة")
                }
                     
            Favorite()
                                 .tabItem {
                              Image (systemName: "heart")
                              Text("المفضلة")
                         }
                     
               
            
            HomeAll()
                    .tabItem {
                         Image(systemName: "house")
                        Text("الرئيسية")
                        
                    }
    
}
        .accentColor((Color("Color")))
        
        
        
        
    
    }
}
