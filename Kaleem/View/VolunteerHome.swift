//
//  VolunteerHome.swift
//  Kaleem
//
//EQuizV
//

import SwiftUI
import FirebaseAuth
import Firebase

struct VolunteerHome: View {
    @EnvironmentObject var session: SessionStore
    @State var index = 0
    @ObservedObject private var PViewModel = ProfileVM()
    @EnvironmentObject var quizManager1: EQuizManagerVM
    
    var body: some View {
        
        NavigationView{
            
            
            
            
            
            VStack(spacing: 0){
                
                
                HStack{
                    
                    VStack{
                        
                        //image...
                        HStack{
                            
                            Spacer()
                        }
                        
                        HStack{
                            VStack(alignment: .trailing, spacing: 15){
                                
                                
                                Text(" أهلاً بك .. " + PViewModel.KaleemUser.name)
                                    .font(Font.custom("Almarai-Bold", size: 35))
                                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                    .padding(.top,30)
                                
                                
                                
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
                    .padding(.bottom, 50)
                    
                    
                    .frame(width: UIScreen.main.bounds.width - 100)
                    
                    .background(Color("Color"))
                    .clipShape(Corners(corner: [.topLeft, .topRight, .bottomRight], size: CGSize(width: 70, height: 55)))
                    
                } .padding(.trailing,80)
                
                
                
                
                // ScrollView( [.horizontal,.vertical], showsIndicators: false){
                ScrollView( .vertical, showsIndicators: false){
                    
                    HStack(spacing: 10){
                        
                        
                        VStack(spacing: 10){
                            
                            
                            
                            HStack{
                                
                                VStack(alignment: .trailing, spacing: 15){
                                    Text("اختبار المعرفة")
                                        .font(Font.custom("Almarai-Bold", size: 30))
                                        .foregroundColor(.black.opacity(0.6))
                                    
                                    Text("اختبر مستواك في لغة الإشارة !")
                                        .font(Font.custom("Almarai-Bold", size: 20))
                                        .foregroundColor(.black.opacity(0.6))
                                    
                                }//VStack#1
                                
                                
                                
                            }        .padding()
                            
                            
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                NavigationLink(
                                    destination: EQuizV(quizManager1: _quizManager1).navigationBarHidden(true),
                                    label: {
                                        Image(systemName: "newspaper.circle.fill")
                                            .foregroundColor(Color("Color"))
                                            .font(.system(size: 65))
                                    }
                                )
                                
                            }
                            
                            .padding(.trailing,210)
                            .padding(.bottom,55)
                            .padding(.top, -10)
                            //.padding(.top,10)
                            
                            
                        }
                        
                        //setting custom width...
                        
                        .padding(.leading, 30)
                        .padding(.top, 60)
                        
                        // .frame(width: UIScreen.main.bounds.width / 2)
                        .frame(width: 300, height: 200 )
                        .background(self.index == 0 ?  Color("Color").opacity(0.2) : .gray.opacity(0.1))
                        .cornerRadius(35)
                        .onTapGesture {
                            self.index = 0
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                    // .safeAreaInset(edge: <#T##VerticalEdge#>, content: <#T##() -> View#>)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.top, 60)
                    .padding(.bottom, 15)
                    
                    
                    
                    //Favorite card
                    
                    
                }
                
                
                
                
            }
            
            
            
            
            
            
        }
        .onAppear(perform: { PViewModel.fetchUser();} )
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerHome()
    }
}
