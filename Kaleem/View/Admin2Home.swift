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
    @State var showingAlert = false
   
    var body: some View {
        
        VStack{
            
            
        //🛑🛑🛑use one of the bellow strings to call the page BrowseQuizV
        // "EducationalQuiz" -> اختبار المعرفة
        // "AcceptanceQuiz" -> ااختبار القبول
            NavigationLink(destination: BrowseQuizV(quizColl: "AcceptanceQuiz"), isActive: $showAccQuiz, label: {EmptyView()} )
            HStack{

                Button(action: {
                    showingAlert = true
                }, label: {
             
                    Image("logout").resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 100)
           
                })
                    .padding(.top, 20)
                    .padding(.leading,200)
                    .alert("هل أنت متأكد من تسجيل الخروج؟", isPresented: $showingAlert, actions: {
                          Button("نعم", action: {session.signOut()})
                          Button("لا", role: .cancel, action: {})
                        })
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
                
                
    
 
                VStack(spacing: 10){
                    
                    //Call cards view methods
                    //Cards()
                    
                    //VC card
                    ZStack{
                        

                        
                        HStack{
                            
                            VStack(alignment: .trailing, spacing: 15){
                           Text("اختبار القبول")
                               
                                    
                                    .font(Font.custom("Almarai-Bold", size: 30))
                                    .padding(.leading, 60)
                                    .padding(.bottom, 80)

                                
                                
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
                        .padding(.trailing,200)
                        .padding(.bottom,55)
                        .padding(.top, -10)
                        //.padding(.top,10)
                        
                        
                    }
                    
                    //setting custom width...
                    
                    .padding(.leading, 30)
                    .padding(.top, 60)
                    .frame(width: 300, height: 200 )
                    .background(self.index == 0 ?  Color("Color").opacity(0.2) : .gray.opacity(0.1))
                    .cornerRadius(35)
                    .onTapGesture {
                        self.index = 0
                    }
                    
                    //location card
                    
                    ZStack{
                        

                        
                        HStack{
                            
                            VStack(alignment: .trailing, spacing: 15){
            Text("اختبار المعرفة")
                                    .font(Font.custom("Almarai-Bold", size: 30))
                                    .padding(.leading, 60)
                                    .padding(.bottom, 80)

                                
                                
                            }//VStack#1

                        }        .padding()
                        
                        
                        
                        HStack{
                            
                            Spacer()
                            //consider to change it sutibale icons
                            
                            
                            /*🛑🛑🛑use one of the bellow strings to call the page BrowseQuizV
                            // "EducationalQuiz" -> اختبار المعرفة
                            // "AcceptanceQuiz" -> اختبار القبول*/
                                NavigationLink(
                                    destination:     BrowseQuizV(quizColl: "EducationalQuiz").navigationBarHidden(true),
                                label: {
                                    Image(systemName: "book.closed.circle.fill")
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
                  //  .frame(width: 180, height: 160 )
                    .frame(width: 300, height: 200 )
                    .background(self.index == 1 ?  Color("Color").opacity(0.2) : .gray.opacity(0.1))
                    .cornerRadius(35)
                    .onTapGesture {
                        self.index = 1
                }
                    

                    
                    
                    

                    
                }
          
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .padding(.top, 25)
                .padding(.bottom, 15)

        }

     
    }   .navigationBarTitle("")
            .navigationBarHidden(true)
            .foregroundColor(Color.black.opacity(0.7))
       

            

        }
    
}
    


struct Admin2Home_Previews: PreviewProvider {
    static var previews: some View {
        Admin2Home()
    }
}

