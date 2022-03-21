//
//  Home.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 11/08/1443 AH.
//

import Foundation
import SwiftUI
import UIKit
import CoreLocationUI



struct AdminHome: View{
   
    @State var showVideCall: Bool = false
    @State var VM = VideoCallVM()
    @State var index = 0
    @StateObject var locationManager = LocationManager()
    @State var showhos: Bool = false
    @EnvironmentObject var session: SessionStore
    //@State var showuni: Bool = false
    
    var body: some View{
        
        NavigationView{
            
            
        
            
            
            VStack(spacing: 0){
                

                HStack{
      
                    VStack{
                        
                        //image...
                        HStack{
                            
                            Spacer()
                        }
                        
                        HStack{
                            VStack(alignment: .leading, spacing: 15){
                                
                                Text("كليــــم")
                                    .font(Font.custom("Almarai-Bold", size: 35))
                                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                
//
                               Text("حيثما لوّحت يداك وتُرجم صوتك")
                                    .fontWeight(.bold)
                                    .font(Font.custom("Almarai-Bold", size: 25))
                                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                
                                
                                
                                
                                
                            }
                            
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding(.leading,50)
                        //.padding(.top,20)
                    }
                    // setting custom width...
                    .padding(.bottom, 70)
                   
                
                    .frame(width: UIScreen.main.bounds.width - 100)
             
                    .background(Color("Color"))
                    .clipShape(Corners(corner: [.topLeft, .topRight, .bottomRight], size: CGSize(width: 70, height: 55)))
                    
                } .padding(.trailing,80)
                
      
                
                
                // ScrollView( [.horizontal,.vertical], showsIndicators: false){
                ScrollView( .vertical, showsIndicators: false){

                    HStack(spacing: 10){
                        
                        //Call cards view methods
                        //Cards()
                        
                        //VC card
                        VStack(spacing: 10){
                            

                            
                            HStack{
                                
                                VStack(alignment: .trailing, spacing: 15){
                               Text("اختبار القبول")
                                        .kerning(1.6)
                                        
                                        .font(Font.custom("Almarai-Bold", size: 25))
//                                        .foregroundColor(.gray.opacity(1.5))
//                                        .padding(.leading, 60)
//                                        .padding(.bottom,-10)
//
                                    
                                    
//                                    Text("من خلال مكالمة مرئية")
//                                        .font(Font.custom("Almarai-Bold", size: 20))
//                                        .foregroundColor(.gray.opacity(0.9))
//                                      //  .foregroundColor(Color("DarkGray").opacity(0.5) )
//                                        .padding(.top, -7)
                                    
                                    
                                }//VStack#1
                                
                         
                                
                                
                            }  .padding()
                            
                            
                            
                            HStack{
                                
                                Spacer()
                                //consider to change it sutibale icons
                                
                       
                                
                                
                                NavigationLink(
                                    destination:     BrowseAccQuizV().navigationBarHidden(true),
                                    label: {
                                        Image(systemName: "newspaper.circle.fill")
                                            .foregroundColor(Color("Color"))
                                            .font(.system(size: 75))
                                    }
                                )
                                
                            }
                            .padding(.trailing,130)
                            .padding(.bottom,25)
                            //.padding(.top,10)
                            
                            
                        }
                        
                        //setting custom width...
                        
                        .padding(.leading, 30)
                        .padding(.top, 60)
                        
                   // .frame(width: UIScreen.main.bounds.width / 2)
                        .frame(width: 200, height: 200 )
                        .background(self.index == 0 ?  Color("Color").opacity(0.2) : .gray.opacity(0.1))
                        .cornerRadius(35)
                        .onTapGesture {
                            self.index = 0
                        }
                        
                        //location card
                        
                        VStack(spacing: 10){
                            

                            
                            HStack{
                                
                                VStack(alignment: .trailing, spacing: 15){
                   Text("الاختبار الشهري")
                                        .font(Font.custom("Almarai-Bold", size: 25))
                                          //   .foregroundColor(.gray.opacity(1.5))
//                                             .padding(.leading, -30)
//                                             .padding(.top, -25)
                                    
                                    
//
//                                 Text("ترجم كتابتك لنص مسموع")
//                                        .font(Font.custom("Almarai-Bold", size: 20))
//                                        .foregroundColor(.gray.opacity(0.9))
//                                        .padding(.top, -7)
                                    
                                    
                                }//VStack#1
                        
                                
                       //         Spacer()
                                
                                
                            }        .padding()
                            
                            
                            
                            HStack{
                                
                                Spacer()
                                //consider to change it sutibale icons
                                
                                NavigationLink(
                                    destination:     TextToSpeechV().navigationBarHidden(true),
                                    label: {
                                        Image(systemName: "newspaper.circle.fill")
                                            .foregroundColor(Color("Color"))
                                            .font(.system(size: 65))
                                    }
                                )
                                
                            }
                            
                            .padding(.trailing,130)
                            .padding(.bottom,50)
                            .padding(.top, -10)
                            //.padding(.top,10)
                            
                            
                        }
                        
                        //setting custom width...
                        
                        .padding(.leading, 30)
                        .padding(.top, 60)
                        
                   // .frame(width: UIScreen.main.bounds.width / 2)
                        .frame(width: 180, height: 160 )                        .background(self.index == 1 ?  Color("Color").opacity(0.2) : .gray.opacity(0.1))
                        .cornerRadius(35)
                        .onTapGesture {
                            self.index = 1
                    }
                        
   
                        
                        
                        
   
                        
                    }
                   // .safeAreaInset(edge: <#T##VerticalEdge#>, content: <#T##() -> View#>)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.top, 25)
                    .padding(.bottom, 15)
                    
                    
                    //Favorite card
     
                    
                }
           
                Spacer()
                
                Button(action: {
                    
                    session.signOut()
                }, label: {
                    
                    
                           Image(systemName: "arrow.up.right.circle.fill")
                         
                               .font(.system(size: 45))
                               .foregroundColor(Color("Color"))
    //                                   .padding(.trailing,150)
                              // .padding(.bot)
                    
                })
                
            }
     
            
            //moving view up
            //giving only space 10 b/w
      //      .padding(.top, -70)
            
            //        .edgesIgnoringSafeArea(.all)
            //        .statusBar(hidden: true)
            

            
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
        
    }
    
}

struct AdminCorners: Shape{
    
    var corner : UIRectCorner
    var size : CGSize
    func path(in rect: CGRect) -> Path{
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: size)
        
        return Path (path.cgPath)
    }
}


struct AdminHome_Previews: PreviewProvider {
    // @State var selectedTab = "house"
    static var previews: some View {
        AdminHome()
        
    }
}



