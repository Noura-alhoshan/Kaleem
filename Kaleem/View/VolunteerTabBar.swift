////
////  VolunteerTabBar.swift
////  Kaleem
////
////  Created by Raneem AlRashoud on 14/08/1443 AH.
////
//
//import Foundation
//import SwiftUI
//
//struct VolunteerTabBar: View{
//   
//    @Binding var selectedTab: String
//   // @Binding var image: String
//    //Storing each tab midpoints to animate it in future...
//    @State var tabPoints : [CGFloat] = []
//    var body: some View{
//        
//        
//    
//        
//        HStack(spacing: 0){
//            // Tab bar buttons
//            VolunteerTabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
//            VolunteerTabBarButton(image: "bell", selectedTab: $selectedTab, tabPoints: $tabPoints)
//            VolunteerTabBarButton(image: "square.grid.2x2", selectedTab: $selectedTab, tabPoints: $tabPoints)
//            VolunteerTabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
//            
//        }
//        .padding()
//       .background(Color.black.opacity(0.15)
//                    .clipShape(TabCurve(tabPoint: getCurvePoint()-15)))
//       .overlay(
//       Circle()
//        .fill(Color("Color"))
//        .frame(width: 10, height: 10)
//        .offset(x: getCurvePoint() - 20)
//       ,alignment: .bottomLeading
//       )
//     //   .background(Color.white.opacity(0.08)).blur(radius: 10)
//        .cornerRadius(30)
//        .padding(.horizontal)
//    }
//    
//    // extracting point ...
//    func getCurvePoint()-> CGFloat{
//        
//        //if tabpoint is empty...
//        if tabPoints.isEmpty{
//            
//            return 10
//        }
//        
//        else {
//            switch selectedTab {
//            case "person":
//                return tabPoints[0]
//            case "bell":
//                return tabPoints[1]
//            case "square.grid.2x2":
//                return tabPoints[2]
//            default:
//                return tabPoints[3]
//            }
//        }
//    }
//
//   
//
//}
//
//
//
//struct VolunteerTabBarButton: View{
//    var image: String
//    @Binding var selectedTab: String
//    @Binding var tabPoints: [CGFloat]
//    @State var showResetPassword: Bool = false
//
//    @State var obj = navigotor()
//
//    var body: some View{
//        
//   
//        
//        GeometryReader{
//            
//            //For getting mid point of each button for curve animation...
//            reader -> AnyView in
//            //extracting midpoint and storing
//            
//            let midX = reader.frame(in: .global).midX
//            DispatchQueue.main.async {
//                
//               //avoiding junk data
//                if tabPoints.count <= 4{
//                    tabPoints.append(midX)
//                }
//            }
//            return AnyView (
//            
//                Button(action:{
//                    
//                    // changing tab...
//                    // spring animation...
//                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
//                        
//                        selectedTab = image
//                        showResetPassword = true
//
//                        NavigationLink(destination: ForgotPassword(), isActive: $showResetPassword, label: {EmptyView()} )
//
//                    //    obj.navigate(image: selectedTab )
//                        
//                    }
//                }, label:{
//                    //filling the color if it's selected...
//                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "" )")
//                       .font(.system (size: 25, weight: .semibold))
//                       .foregroundColor(Color("Color"))
//                       // Lifting view...
//                    //if its selected...
//                       .offset(y: selectedTab == image ? -10 : 0)
//                  
//                })
//                
//                // Max Frame...
//                .frame(maxWidth: .infinity, maxHeight: .infinity))
//            
//        }
//        // maxHeight
//        .frame(height: 50)
//    }
//    
//   
//    
//    
//}
//
//class navigotor : ObservableObject{
//    
//    
//    
//    func navigate(image: String){
//      
//        NavigationView {
//        switch image {
//        case "person":
//            NavigationLink(
//                destination:     SignOut().navigationBarHidden(true),
//                label: {
//        
//                }
//            )
//        
//        
//        case "bell":
//            NavigationLink(
//                destination:     SignUpInScreen().navigationBarHidden(true),
//                label: {
//        
//                }
//            )
//        case "house":
//        
//            NavigationLink(
//                destination:     SignUpInScreen().navigationBarHidden(true),
//                label: {
//        
//                }
//            )
//        default:
//            NavigationLink(
//                destination:     HomeAll().navigationBarHidden(true),
//                label: {
//        
//                }
//            )
//        } }
//        
//    }
//}
