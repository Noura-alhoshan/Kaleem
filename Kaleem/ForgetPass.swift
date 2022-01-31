//
//  ForgetPass.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 28/06/1443 AH.
//

import SwiftUI
struct ForgetPass : View{
    
    @State var email: String = ""

        
        var body: some View {
            
            GeometryReader{_ in
                
                VStack{
                        TopBar()
             
                  
                   Text("إعادة تعيين كلمة المرور")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 50)
                        .padding(.top, 70)
                    
                    HStack{
                        Text("الرجاء إدخال بريدك الإلكتروني ليصلك رابط إعادة تعيين كلمة المرور ")
                            .foregroundColor(.black)
                            .multilineTextAlignment(TextAlignment.center).padding(.bottom,50)
                                        }
                    
                    
                    VStack{
                        
                        /* EMAIL FIELD*/
                        VStack{
                            HStack(spacing: 15)  {
                                TextField("البريد الإلكتروني", text: self.$email
                                          
                                ).multilineTextAlignment(TextAlignment.trailing)

                                Image(systemName: "envelope.fill")
                                    .foregroundColor(Color("Kcolor"))
                                
                            }
                            Divider().background(Color("Kcolor").opacity(0.5))
                        }
                        
                        .padding(.horizontal)
                        .padding(.top,20)
                    
                   
                        
                
                    } // the big one
       
                    
                    /*CONTAINER*/
                    .padding()
                    .padding(.bottom, 30)
                    
                    /*WITHIT OR WITHOUT IT?*/
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal,20)
                    
                    /*BUTTON*/
                    Button(action: {
                        
                    }){
                        Text("إرسال")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal,50)
                            .background(Color("Kcolor"))
                            .clipShape(Capsule())
                            .shadow(color: Color.red.opacity(0.1), radius:5 , x: 0, y: 5)
                    }
                    .offset(y:25)

                .padding(.horizontal)
                .padding(.top,10)
                    
                    
                
                    
                }
                
                }


          //  .padding(.top,10)
            .background(Color(.white).edgesIgnoringSafeArea(.all))
            }
    }
struct ForgetPass_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPass()
    }
}
