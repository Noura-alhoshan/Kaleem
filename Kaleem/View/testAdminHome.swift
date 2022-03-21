//
//  Home.swift
//  Kaleem
//
//  Created by Sarah S on 24/06/1443 AH.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct Admin2Home: View {
    @EnvironmentObject var session: SessionStore
    @State var showAccQuiz: Bool = false
    @State var index = 0
   
    var body: some View {
        
        VStack{
            
            NavigationLink(destination: BrowseAccQuizV(), isActive: $showAccQuiz, label: {EmptyView()} )
            HStack{

                            Button(action: {
                                session.signOut()
                            },
                 
                    label: {
                      Text("تسجيل الخروج")
                            .font(Font.custom("Almarai-Regular", size: 20))
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color"))
                            .padding(.leading, 180)
                            .background(.white)
                   
                    }
                )
                    .navigationBarHidden(true)
            }
            HStack{
  
                VStack{

                    //image...
           
//
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
                            
                            
                            
                            
                            
                        }.padding(.top,30)
                        
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
                .padding(.top,35)
            
            
            
            ScrollView( .vertical, showsIndicators: false){
                
                
    
 
                HStack(spacing: 10){
                    
                    //Call cards view methods
                    //Cards()
                    
                    //VC card
                    VStack(spacing: 10){
                        

                        
                        HStack{
                            
                            VStack(alignment: .trailing, spacing: 15){
                           Text("اختبار القبول")
                               
                                    
                                    .font(Font.custom("Almarai-Bold", size: 25))

                                
                                
                            }//VStack#1
                            
                     
                            
                            
                        }  .padding()
                        
                        
                        
                        HStack{
                            
                            Spacer()
                            //consider to change it sutibale icons
                            
                   
                            
                            
                            Button(action: {
                                //AddAccQuizV()
                                showAccQuiz = true
                            }, label: {
                            
                                Image(systemName: "newspaper.circle.fill")
                                    .foregroundColor(Color("Color"))
                                    .font(.system(size: 65))
                            })
                            
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
                    .frame(width: 180, height: 160 )
                    .background(self.index == 0 ?  Color("Color").opacity(0.2) : .gray.opacity(0.1))
                    .cornerRadius(35)
                    .onTapGesture {
                        self.index = 0
                    }
                    
                    //location card
                    
                    VStack(spacing: 10){
                        

                        
                        HStack{
                            
                            VStack(alignment: .trailing, spacing: 15){
            Text("اختبار الشهر")
                                    .font(Font.custom("Almarai-Bold", size: 25))

                                
                                
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
          
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .padding(.top, 25)
                .padding(.bottom, 15)
            
//            Button(action: {
//                session.signOut()
//            }, label: {
//                Text("تسجيل الخروج")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 220, height: 60)
//                    .background(Color("Color").opacity(0.3))
//                    .cornerRadius(35.0)
//            })
//                    .padding(.top,50)
        }

     
    }   .navigationBarTitle("")
            .navigationBarHidden(true)
       

            

        }
    
}
    


struct Admin2Home_Previews: PreviewProvider {
    static var previews: some View {
        Admin2Home()
    }
}


//Button(action: {
//    //AddAccQuizV()
//    showAccQuiz = true
//}, label: {
//
//    Image(systemName: "newspaper.circle.fill")
//        .foregroundColor(Color("Color"))
//        .font(.system(size: 75))
//})
