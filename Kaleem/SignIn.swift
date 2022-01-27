//
//  ContentView.swift
//  Shared
//
//  Created by Sara S on 19/06/1443 AH.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)


struct SignInForm: View {
    
        @EnvironmentObject var session: SessionStore
        @State var email: String = ""
        @State var password: String = ""
        @State var loading = false
        @State var error = false

       

        func signIn () {
            loading = true
            error = false
            session.signIn(email: email, password: password) { (result, error) in
                self.loading = false
                if error != nil {
                    self.error = true
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
    
    
    //@State var username: String = ""
    //@State var password: String = ""
    
   // @State var authenticationDidFail: Bool = false
    //@State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        
      
               
        VStack {
            VStack(alignment: .center) {
                HelloText().padding(.bottom,55)
                //UserImage()
                UsernameTextField(username: $email)
                PasswordSecureField(password: $password)
                if (error) {
                           
                    Text("معلومات الدخول غير صحيحة ، الرجاء المحاولة مرة أخرى")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                
                Button(action: {}, label: {
                    Text("هل نسيت كلمة المرور؟").fontWeight(.bold).foregroundColor(.blue)
                    
                }).padding(.bottom,35)
                
                
                Button(action: signIn) {
                    LoginButtonContent()
                }
            }.padding(.bottom,140)
            
            //.fixedSize(horizontal: <#T##Bool#>, vertical: true
            //)
            .overlay(
                HStack{
                    
                    Button(action: {}, label: {
                        Text("إنشاء حساب").fontWeight(.bold).foregroundColor(.blue)
                        
                    })
                    
                    Text("ليس لديك حساب؟ ").fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    
                }
                ,alignment: .bottom
            )
            .padding()
           
//            if authenticationDidSucceed {
//                Text("Login succeeded!")
//                    .font(.headline)
//                    .frame(width: 250, height: 80)
//                    .background(Color.yellow)
//                    .cornerRadius(20.0)
//                    .animation(Animation.default)
//            }
        }
    }

    
        
    }





struct HelloText: View {
    var body: some View {
        Text("مرحبًا بك مرة أخرى")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

//struct UserImage: View {
//    var body: some View {
//        Image("userImage")
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 150, height: 150)
//            .clipped()
//            .cornerRadius(150)
//            .padding(.bottom, 75)
//    }
//}

struct LoginButtonContent: View {
    var body: some View {
        Text("دخول")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}

struct UsernameTextField: View {
    
    @Binding var username: String
    
    var body: some View {
        TextField("البريد الإلكتروني", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("كلمة المرور", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
