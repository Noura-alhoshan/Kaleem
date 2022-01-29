//
//  LogInVM.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 26/06/1443 AH.
//

import SwiftUI


struct ContentView: View{
    var body: some View{
        
        Home()
        // for light?
           .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}


struct Home : View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        GeometryReader{_ in
            
            VStack{
               Text("مرحبا بك مجددًا")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
                
                VStack{
                    HStack{
                        Text("تسجيل دخول")
                            .foregroundColor(.black)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    /* EMAIL FIELD*/
                    VStack{
                        HStack(spacing: 15)  {
                            TextField("البريد الإلكتروني", text: self.$email )

                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("Kcolor"))
                            
                        }
                        Divider().background(Color("Kcolor").opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                
                
                
                /*PASS FIELD*/
                VStack{
                    HStack(spacing: 15)  {
                        SecureField("كلمة المرور ", text: self.$password )
                          
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Kcolor"))
                        
                    }
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
                    
                /* PASS FIELD */
                    
                    
                    /*FORGET PASS*/
                HStack{
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }){
                        Text("هل نسيت كلمة المرور؟")
                            .foregroundColor(Color("Kcolor").opacity(0.6))
                    }
            }
                .padding(.horizontal)
                .padding(.top,30)
                    
                    
            
                } // the big one
   
                
                /*CONTAINER*/
                .padding()
                .padding(.bottom, 5) //زetween button and forget
                
                /*WITHIT OR WITHOUT IT?*/
               .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal,20)
                
                /*BUTTON*/
                Button(action: {
                    
                }){
                    Text("سجل")
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
                
                /*signup*/
                HStack{
                    
                    Button(action: {
                        
                    }){
                        Text("ليس لديك حساب؟ سجل الان")
                            .foregroundColor(Color("Kcolor").opacity(0.6))
                    }
                    .padding(.horizontal)
                    .padding(.top,30)
            }
            }
     
            }
        
     
        
    
        .padding(.top,80)
        .background(Color(.white).edgesIgnoringSafeArea(.all))
        }
}



