//
//  SignIn.swift
//  Kaleem
//
//  Created by Sarah S on 01/07/1443 AH.
//


import SwiftUI


struct SignIn : View {
    
    @EnvironmentObject var session: SessionStore
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    @State var showSignUp: Bool = false
    @State var showResetPassword: Bool = false
    
    func signIn () {
        loading = true
        error = false
        email = email.trimmingCharacters(in: .whitespaces)
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
               
            if error != nil {
                self.error = true
            }
            else {
                //self.email = ""
                //self.password = ""
                session.signInStraem(email: email, password: password)
                //u can put it in line 29 and remove the comment in SessionStore class
                session.listen()
               // print(session.UserType)
            NavigationView{
                switch session.UserType {
                case "Volunteer":
                    VolunteerHome()
                case "Impaired":
                    ImpairedHome()
                    
                case "":
                    AdminHome()
                default:
                    ForgotPassword()
                }
                }
            }
        }
    }
    
    
    var body: some View {
        
       
        GeometryReader{_ in
    
            VStack(alignment: .center){
               // TopBar()
                
                //TO NAVIGATE TO FORGOT PASSWORD PAGE
               NavigationLink(destination: ForgotPassword(), isActive: $showResetPassword, label: {EmptyView()} )
              
                //TO NAVIGATE TO SIGN UP PAGE
                NavigationLink(destination: SignUpTaps(), isActive: $showSignUp, label: {EmptyView()} )
                HStack(alignment: .center, spacing: 0){
                Image("Logo")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 150.0, height: 70.0)
                     .padding(.top, -30)
                }
               Text("مرحبا بك مجددًا")
                    .foregroundColor(.black)
                    .font(.title)
                    
                 //   .fontWeight(.bold)
                    .padding(.bottom, 30)
                //    .padding(.top, 70)
                
              


                
                VStack{
                    HStack{
                        Text("تسجيل دخول")
                            .foregroundColor(.black)
                            .font(.title2)
                           // .fontWeight(.bold)
                    }
                    
                    
                    /* EMAIL FIELD*/
                    VStack{
                        HStack(spacing: 15)  {
                            TextField("البريد الإلكتروني", text: self.$email
                            )
                                .disableAutocorrection(true)
                                .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)


                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("Kcolor"))
                            
                        }
                        Divider().background(Color("Kcolor").opacity(0.5))
                    }
                    
                    .padding(.horizontal)
                    .padding(.top,20)
                
                    /*PASS FIELD*/
                    SecureInputView("كلمة المرور", text: $password)
              

                    if (error) {
                               
                        Text("معلومات الدخول غير صحيحة ، حاول مرة أخرى")
                            //.offset(y: -10)
                            .foregroundColor(.red).padding(.top,13)
                    }
                    else {
                        Text(" ").foregroundColor(.red).padding(.top,13)
                    }
                    
                    /*FORGET PASS*/
                HStack{
                    
                    Button(action: {
                        self.showResetPassword = true
                    }){
                        Text("هل نسيت كلمة المرور؟")
                            .foregroundColor(Color.black)
                            .underline()
                            
                    }
            }
                .padding(.horizontal)
                .padding(.top,10)
                    
                    
            
                } // the big one
   
                
                /*CONTAINER*/
                .padding()
                .padding(.bottom, 5)
                /*WITHIT OR WITHOUT IT?*/
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal,20)
                
                /*BUTTON*/
                Button(action: signIn){
                    Text("دخول")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal,50)
                        .background(Color("Kcolor"))
                        .clipShape(Capsule())
                        .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
                }
                .offset(y:25)

            .padding(.horizontal)
            .padding(.top,10)
                
                
                
                /*SIGN UP*/
                VStack{
                    HStack(spacing: 6)  {
                        
                        Button(action: {
                            self.showSignUp = true
                        }){
                            Text("سجل الان")
                                .foregroundColor(Color("Kcolor"))
                                .underline()
                        }
                        Text("ليس لديك حساب؟")
                          
                      
                }
                    }
                
                .padding(.horizontal)
                .padding(.top,130)
                
            }
            
            
                
            }


      //  .padding(.top,10)
        .background(Color(.white).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
       .navigationBarHidden(true)
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






struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        VStack{
        HStack(spacing: 15)  {
            if isSecured {
                SecureField(title, text: $text).multilineTextAlignment(TextAlignment.trailing)
                   // .background(lightGreyColor)
                   //.cornerRadius(5.0)
                    //.padding(.bottom, 20)
            } else {
                TextField(title, text: $text)
                    .disableAutocorrection(true)
                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
//                    .padding()
//                    .background(lightGreyColor)
//                    .cornerRadius(5.0)
                   
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .foregroundColor(Color("Kcolor")) 
            }
        }
            Divider().background(Color("Kcolor").opacity(0.5))
                           }
                    .padding(.horizontal)
                    .padding(.top,30)
}
}

