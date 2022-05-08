//
//  ImpairedTabBar2.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 16/08/1443 AH.
//
import SwiftUI
struct ImpairedTabBar2: View {
    @State private var selected = 3
  
 
    
    var body: some View {
        
     
        
        TabView(selection: $selected) {
            
            ProfileView()
                .tag(0)
                .tabItem {
                    Image (systemName: "person")
                    Text("حسابك")
                }
            
            

            SignToTextV()
                .tag(1)
                .tabItem {
                    Image (systemName: "hand.raised")
                    Text("الترجمة")
                }
            
            FavoriteListV()
                .tag(2)
                .tabItem {
                    Image (systemName: "heart")
                    Text("المفضلة")
                }
            
            
            
            HomeAll()
                .tag(3)
                .tabItem {
                    Image(systemName: "house")
                    Text("الرئيسية")
                    
                }
            
        }
        .accentColor((Color("Color")))

     
        
        
        
        
    }
    
}
