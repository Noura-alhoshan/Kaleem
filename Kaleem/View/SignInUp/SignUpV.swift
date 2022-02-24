//
//  ContentView.swift
//  Login App
//
//  Created by Kavsoft on 13/06/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//

import SwiftUI
import Combine
//struct ContentView: View {
//    var body: some View {
//        
//        Home()
//            // for light status bar...**
//           // .preferredColorScheme(.dark)
//    }
//}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/

struct SignUpTaps : View {
    
    @State var index = 1
    
    var body: some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Image("Logo")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 150.0, height: 70.0)
                     .padding(.top, -55)
                
              Text("انشاء حساب")
                     .foregroundColor(.black)
                     .font(.title)
                     .font(.system(size: 30))
                     .fontWeight(.bold)
                    .padding(.bottom, -30)
                    
                
                ZStack{
                    
                    SignUP(index: self.$index)
                        // changing view order...
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)

                }
                .padding(.top, 50)
                
               
            
            }
            .padding(.vertical)
               
        }
        .background(Color.white.edgesIgnoringSafeArea(.all)) //Whole page
    }
}

// Curve...

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            // right side curve...
            
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}


struct CShape1 : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            // left side curve...
            
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}

struct Login : View {
    
    //@EnvironmentObject var VM: SignUpVM
    @ObservedObject var VM = SignUpVM()
    //@ObservedObject var userModel = User2()
    //@State var userType = "Volunteer"
    @State var username = ""
    @State var phoneNo = "" // change to phone
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @Binding var index : Int
    
    @State var usernameErr = ""
    @State var emailErr = ""
    @State var phoneNoErr = ""
    @State var passErr = ""
    @State var repassErr = ""
    
    // call from SignUpVM : View Model (firebase)
     func V_SignUp (/*user: User2*/){
         // for Auth.
         VM.createNewAccount(email: email, password: pass)
         // for firestore collection
         VM.addDataToCollection(userType: "Volunteer", username: username, phone: phoneNo, email: email)
        
    }
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            VStack{
                
                HStack{
                    
                    VStack(spacing: 10){
                        
                        Text("متطوع")
                            .foregroundColor(self.index == 0 ?  .black : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color("Kcolor") : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)// for top curve...
                
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("اسم المستخدم", text: self.$username)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            .onChange(of: self.username, perform: {newValue in self.usernameErr = VM.validateUserName(username: self.username)})
                        Image(systemName: "person.fill")
                            .foregroundColor(Color("Kcolor"))
                    }
                
                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.usernameErr != "" {
                        Text(self.usernameErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            //.padding(.bottom)
                            //.multilineTextAlignment(TextAlignment.trailing)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 40)
              
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("رقم الجوال", text: self.$phoneNo)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            .onChange(of: self.phoneNo, perform: {newValue in self.phoneNoErr = VM.validatePhoneNo(phone: self.phoneNo)})
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.phoneNoErr != "" {
                        Text(self.phoneNoErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            //.padding(.bottom)
                            //.multilineTextAlignment(TextAlignment.trailing)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("البريد الإلكتروني", text: self.$email)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            .onChange(of: self.email, perform: {newValue in self.emailErr = VM.validateEmail(email: self.email)})
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Kcolor"))

                    }

                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.emailErr != "" {
                        Text(self.emailErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            //.padding(.bottom)
                            //.multilineTextAlignment(TextAlignment.trailing)
                    }

                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                /*PASS FIELD*/
                VStack{
                SecureInputView2("كلمة المرور", text: $pass).onChange(of: self.pass, perform: {newValue in self.passErr = VM.validatePass(pass: self.pass)})
                    
                    if self.passErr != "" {
                        Text(self.passErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            //.padding(.bottom)
                            //.multilineTextAlignment(TextAlignment.trailing)
                    }
                
                }
         .padding(.horizontal)
         .padding(.top,30)
                
                /* VStack{
                    
                    HStack(spacing: 15){
                        
                        SecureField("كلمة المرور", text: self.$pass)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Kcolor"))


                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                */
                /*CONFIRM PASS FIELD*/
                VStack{
                SecureInputView2("تأكيد كلمة المرور", text: $repass)
                        .onChange(of: self.repass, perform: { newValue in
                           
                            if self.pass != self.repass {
                                self.repassErr = "لا تطابق كلمة المرور"
                            }
                        })
                    if self.repassErr != "" {
                        Text(self.repassErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                           // .padding(.bottom)
                          //  .multilineTextAlignment(.center)
                    }                        }
                 .padding(.horizontal)
                 .padding(.top,30)
                    /*VStack{
                    
                    HStack(spacing: 15){
                        
          
                        SecureField("تأكيد كلمة المرور", text: self.$repass)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Kcolor"))
                        

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                */
             
            }
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(Color("KGray")) //Container
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 0
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            // Button...
            
            Button(action: {
                
                V_SignUp() // Submit
            
            }) {
                
                Text("انتقال")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Kcolor"))
                    .clipShape(Capsule())
                    // shadow...
                    .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            // moving view down..
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

// SignUP Page..

struct SignUP : View {
    
    @ObservedObject var VM = SignUpVM()
    
    @State var username2 = ""
    @State var phoneNo2 = ""
    @State var email2 = ""
    @State var pass2 = ""
    @State var repass2 = ""
    @Binding var index : Int
    
    
    @State var usernameErr2 = ""
    @State var emailErr2 = ""
    @State var phoneNoErr2 = ""
    @State var passErr2 = ""
    @State var repassErr2 = ""
    
    // call from SignUpVM : View Model (firebase)
     func S_SignUp (/*user: User2*/){
         // for Auth.
         VM.createNewAccount(email: email2, password: repass2) // CHANGE to pass NOT repass ==============================
         /* for firestore collection Speech-impaired  */
         VM.addDataToCollection(userType: "Deaf", username: username2, phone: phoneNo2, email: email2)
        
    }
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            VStack{
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        
                        Text("أصم")
                            .foregroundColor(self.index == 1 ? .black : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color("Kcolor") : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)// for top curve...
                
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("اسم المستخدم", text: self.$username2)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            .onChange(of: self.username2, perform: {newValue in self.usernameErr2 = VM.validateUserName(username: self.username2)})
                        Image(systemName: "person.fill")
                            .foregroundColor(Color("Kcolor"))
                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.usernameErr2 != "" {
                        Text(self.usernameErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            //.padding(.bottom)
                            //.multilineTextAlignment(TextAlignment.trailing)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                    
                        TextField("رقم الجوال", text: self.$phoneNo2)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            .onChange(of: self.phoneNo2, perform: {newValue in self.phoneNoErr2 = VM.validatePhoneNo(phone: self.phoneNo2)})
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.phoneNoErr2 != "" {
                        Text(self.phoneNoErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            //.padding(.bottom)
                            //.multilineTextAlignment(TextAlignment.trailing)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("البريد الإلكتروني", text: self.$email2)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            .onChange(of: self.email2, perform: {newValue in self.emailErr2 = VM.validateEmail(email: self.email2)})
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.emailErr2 != "" {
                        Text(self.emailErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            //.padding(.bottom)
                            //.multilineTextAlignment(TextAlignment.trailing)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                /*PASS FIELD*/
                VStack{
                SecureInputView2("كلمة المرور", text: $pass2).onChange(of: self.pass2, perform: {newValue in self.passErr2 = VM.validatePass(pass: self.pass2)})
                    
                    if self.passErr2 != "" {
                        Text(self.passErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            //.padding(.bottom)
                            //.multilineTextAlignment(TextAlignment.trailing)
                    }
                
                }
         .padding(.horizontal)
         .padding(.top,30)
                /*
                VStack{
                    
                    HStack(spacing: 15){
                        
                        SecureField("كلمة المرور", text: self.$pass2)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                */
                // replacing forget password with reenter password...
                // so same height will be maintained...
                /*CONFIRM PASS FIELD*/
                VStack{
                SecureInputView2("تأكيد كلمة المرور", text: $repass2)
                        .onChange(of: self.repass2, perform: { newValue in
                           
                            if self.pass2 != self.repass2 {
                                self.repassErr2 = "لا تطابق كلمة المرور"
                            }
                        })
                    if self.repassErr2 != "" {
                        Text(self.repassErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                           // .padding(.bottom)
                          //  .multilineTextAlignment(.center)
                    }                        }
                 .padding(.horizontal)
                 .padding(.top,30)
                
/*                VStack{
                    
                    HStack(spacing: 15){
                                                
                        SecureField("تأكيد كلمة المرور", text: self.$repass2)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Kcolor"))


                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                */
            }
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(Color("KGray"))
            .clipShape(CShape1())
            // clipping the content shape also for tap gesture...
            .contentShape(CShape1())
            // shadow...
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 1
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            // Button...
            
            Button(action: {
                
                S_SignUp() // Submit as Speech-impaired
                
            }) {
                
                Text("تسجيل")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Kcolor"))
                    .clipShape(Capsule())
                    // shadow...
                    .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            // moving view down..
            .offset(y: 25)
            // hiding view when its in background...
            // only button...
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
 

struct SecureInputView2: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
       // VStack{
        HStack(spacing: 15)  {
            if isSecured {
                SecureField(title, text: $text).autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
            } else {
                TextField(title, text: $text)
                    .disableAutocorrection(true)
                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)

                   
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(Color("Kcolor"))
            }
        }
            Divider().background(Color("Kcolor").opacity(0.5))
                         /*  }
                    .padding(.horizontal)
                    .padding(.top,30)*/
}
}
