//
//  TabBar.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 22/07/1443 AH.
//

import SwiftUI


struct ImpairedTabBar: View{
    
    @Binding var selectedTab: String
    //Storing each tab midpoints to animate it in future...
    @State var tabPoints : [CGFloat] = []
    var body: some View{
        
  
        HStack(spacing: 0){
            
            // Tab bar buttons
            ImpairedTabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
            ImpairedTabBarButton(image: "heart", selectedTab: $selectedTab, tabPoints: $tabPoints)
            ImpairedTabBarButton(image: "hand.raised", selectedTab: $selectedTab, tabPoints: $tabPoints)
            ImpairedTabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
        }
        
        .padding()
       .background(Color.black.opacity(0.15)
                    .clipShape(TabCurve(tabPoint: getCurvePoint()-15)))
       .overlay(
       Circle()
        .fill(Color("Color"))
        .frame(width: 10, height: 10)
        .offset(x: getCurvePoint() - 20)
       ,alignment: .bottomLeading
       )
     //   .background(Color.white.opacity(0.08)).blur(radius: 10)
        .cornerRadius(30)
        .padding(.horizontal)
       .padding(.top,600)
    }
    
    // extracting point ...
    func getCurvePoint()-> CGFloat{
        
        //if tabpoint is empty...
        if tabPoints.isEmpty{
            
            return 10
        }
        
        else {
            switch selectedTab {
            case "person":
                return tabPoints[0]
            case "heart":
                return tabPoints[1]
            case "hand.raised":
                return tabPoints[2]
            default:
                return tabPoints[3]
            }
        }
    }
}

struct ImpairedTabBarButton: View{
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    var body: some View{
        
        GeometryReader{
            
            //For getting mid point of each button for curve animation...
            reader -> AnyView in
            //extracting midpoint and storing
            
            let midX = reader.frame(in: .global).midX
            DispatchQueue.main.async {
                
               //avoiding junk data
                if tabPoints.count <= 4{
                    tabPoints.append(midX)
                }
            }
            return AnyView (
            
                Button(action:{
                    
                    // changing tab...
                    // spring animation...
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
                        
                        selectedTab = image
            
                        
                    }
                }, label:{
                    //filling the color if it's selected...
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "" )")
                       .font(.system (size: 25, weight: .semibold))
                       .foregroundColor(Color("Color"))
                       // Lifting view...
                    //if its selected...
                       .offset(y: selectedTab == image ? -10 : 0)
//                    
//                    if image == "person" {
//                        
//                        
//                    }
                    
                   
                  
            
                    
                })
                
                // Max Frame...
                .frame(maxWidth: .infinity, maxHeight: .infinity))
            
        }
        // maxHeight
        .frame(height: 50)
    }
    
    
}

struct ImpairedTabBar_Previews: PreviewProvider {
  // @State var selectedTab = "house"
    static var previews: some View {
     //   TabBarButton(image: selectedTab, selectedTab: $selectedTab)
       // TabBarButton(image: "house",selectedTab: selectedTab)
        
        ImpairedHome()
           // .preferredColorScheme(.dark)
    }
}

//switch image {
//case "person":
//    NavigationLink(
//        destination:     SignOut().navigationBarHidden(true),
//        label: {
//     
//        }
//    )
//    
//
//case "heart":
//    NavigationLink(
//        destination:     SignUpInScreen().navigationBarHidden(true),
//        label: {
//     
//        }
//    )
//case "hand.raised":
//    
//    NavigationLink(
//        destination:     SignUpInScreen().navigationBarHidden(true),
//        label: {
//     
//        }
//    )
//default:
//    NavigationLink(
//        destination:     HomeAll().navigationBarHidden(true),
//        label: {
//     
//        }
//    )
//}
