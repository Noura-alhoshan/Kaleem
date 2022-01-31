
//
//  LogInVM.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 26/06/1443 AH.
//

import SwiftUI


struct SignIn : View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        GeometryReader{_ in
            
            VStack{
                    TopBar()
         
                Image("Logo")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 150.0, height: 70.0)
                     .padding(.top, 75)
                
               Text("مرحبا بك مجددًا")
                    .foregroundColor(.black)
                    .font(.title)
                    
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                //    .padding(.top, 70)
                
              


                
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
                            TextField("البريد الإلكتروني", text: self.$email
                            ).multilineTextAlignment(TextAlignment.trailing)


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
                        SecureField("كلمة المرور ", text: self.$password ).multilineTextAlignment(TextAlignment.trailing)
                          
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
                    
                    Button(action: {
                        
                    }){
                        Text("هل نسيت كلمة المرور؟")
                            .foregroundColor(Color.black)
                            
                    }
            }
                .padding(.horizontal)
                .padding(.top,30)
                    
                    
            
                } // the big one
   
                
                /*CONTAINER*/
                .padding()
                .padding(.bottom, 5)
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
            .padding(.top,20)
                
                
                
                /*SIGN UP*/
                VStack{
                    HStack(spacing: 6)  {
                        
                        Button(action: {
                            
                        }){
                            Text("سجل الان")
                                .foregroundColor(Color("Kcolor"))
                        }
                        Text("ليس لديك حساب؟")
                          
                      
                }
                    }
                
                .padding(.horizontal)
                .padding(.top,170)
                
            }
            
            
                
            }


      //  .padding(.top,10)
        .background(Color(.white).edgesIgnoringSafeArea(.all))
        }
}



/*TOP BAR*/
struct TopBar : View{
    var body: some View {
        VStack( spacing: 20){
            HStack{
               Spacer()
            }
        }.padding()
            .background(Color("Kcolor"))
        
    }
}

struct SignIn_Previews: PreviewProvider{
    static var previews: some View{
        SignIn()
    }
}
