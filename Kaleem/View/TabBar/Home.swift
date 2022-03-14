//
//  Home.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 11/08/1443 AH.
//

import Foundation
import SwiftUI



struct HomeAll: View{
    
    @State var index = 0
    
    var body: some View{
        
   
        VStack(spacing: 0){
            
            HStack{
                
                
                Button(action: {}){
                    // going to the full services
                    Image(systemName: "square.grid.2x2")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                    
                    
                }
                
                Spacer()
                
                
                Button(action: {}){
                    // going to the full services
                    Image(systemName: "person")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                    
                    
                        
                    
                    
                }
            }
            .padding(.top, 70)
            .padding(.horizontal)
            .padding(.bottom, 30)
           // .background(Color("Gray").opacity(0.6))
            //below line will have an effect iff colored
            .clipShape(Corners(corner: [.bottomRight], size: CGSize(width:55, height: 55)))
            
            HStack{
                VStack{
                    
                    //image...
                    HStack{
                        
                        Spacer()
                    }
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 15){
                            
                            Text("أهلاً رنيم!")
                                .font(Font.custom("Almarai-Bold", size: 30))
                             
                                
                            Text("خدمات كليــم")
                                .fontWeight(.bold)
                                .font(Font.custom("Almarai-Bold", size: 35))
                             
                            
                            
                            
                            
                        }
                        
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(.leading,50)
                    .padding(.top,20)
                }
                // setting custom width...
                .padding(.bottom, 70)
                .frame(width: UIScreen.main.bounds.width - 100)
                .background(Color("Color"))
                .clipShape(Corners(corner: [.topLeft, .topRight, .bottomRight], size: CGSize(width: 70, height: 70)))
                
            }
            
            HStack{
                
                
                Button(action: {}) {
                    
                    Image(systemName: "ellipsis")
                        .font(.title)
                }
                
         
                
                
                Spacer()
                
                Text("الخدمات")
                    .font(Font.custom("Almarai-Bold", size: 20))
             
                
            }
            .foregroundColor(Color("DarkGray"))
            .padding(.leading, 25)
            .padding(.top, 25)
            .padding(.trailing)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack(spacing: 25){
                    
                    VStack(spacing: 10){
                        HStack{
                            
                            Spacer()
                            //consider to change it sutibale icons
                            Image("HH")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 15){
                                Text("الاستعانة بصديق")
                                    .font(Font.custom("Almarai-Bold", size: 20))
                                    .foregroundColor(Color("DarkGray"))
                                
                                
                              Text("من خلال مكالمة مرئية")
                                    .font(Font.custom("Almarai-Bold", size: 20))
                                    .foregroundColor(Color("Gray"))
                                
                             
                                
                            }//VStack#1
                            
                            Spacer()
                            
//                            VStack(alignment: .leading, spacing: 15){
//
//                            Text("جمل مساعدة")
//                                .font(Font.custom("Almarai-Bold", size: 20))
//
//
//
//                            }//VStack#2
//
//
//
//                            VStack(alignment: .leading, spacing: 15){
//
//
//                                Spacer()
//
//                            Text("المفضلة")
//                                .font(Font.custom("Almarai-Bold", size: 20))
//
//                            }//VStack#3
                            
                        }
                        .padding(.leading, 25)
                        
                        
                        
                    }
                    
                    //setting custom width...
                    
                    .padding(.bottom, 20)
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .background(self.index == 0 ?  Color("Color") : Color("Gray").opacity(0.2))
                    .cornerRadius(35)
                    .onTapGesture {
                        self.index = 0
                    }
                    
                    
                    VStack(spacing: 10){
                        HStack{
                            
                            Spacer()
                            //consider to change it sutibale icons
                            Image("HH")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 15){
                             Text("جمل مساعدة")
                                    .font(Font.custom("Almarai-Bold", size: 20))
                                    .foregroundColor(Color("DarkGray"))
                                
                                
                        Text("بناء على موقعك الحالي")
                                    .font(Font.custom("Almarai-Bold", size: 20))
                                    .foregroundColor(Color("Gray"))
                                
                             
                                
                            }//VStack#2
                            
                            Spacer()
                            

                            
                        }
                        .padding(.leading, 25)
                        
                        
                        
                    }
                    
                    //setting custom width...
                    
                    .padding(.bottom, 20)
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .background(self.index == 1 ? Color("Color") : Color("Gray").opacity(0.2))
                    .cornerRadius(35)
                    .onTapGesture {
                        self.index = 1
                    }
                    
                }
                
                .padding(.top, 25)
                .padding(.bottom, 15)
            }
            Spacer()
           
        }
        
        //moving view up
        //giving only space 10 b/w
        .padding(.top, -70)
    
//        .edgesIgnoringSafeArea(.all)
//        .statusBar(hidden: true)
        
     
        
        
    }
    
}

struct Corners: Shape{
    
    var corner : UIRectCorner
    var size : CGSize
    func path(in rect: CGRect) -> Path{
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: size)
        
        return Path (path.cgPath)
    }
}





struct HomeAll_Previews: PreviewProvider {
    // @State var selectedTab = "house"
    static var previews: some View {
        HomeAll()
        
    }
}
