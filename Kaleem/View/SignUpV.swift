//
//  ContentView.swift
//  Login App
//
//  Created by Kavsoft on 13/06/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//

import SwiftUI
import Combine
struct ContentView: View {
    var body: some View {
        
        SignUpTaps()
            // for light status bar...**
           // .preferredColorScheme(.dark)
    }
}

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
                
                  /* HStack(spacing: 15){
                    
                    Rectangle()
                          .fill(Color.gray)
                    .frame(height: 1)
                    
                    Text("OR")
                    
                    Rectangle()
                          .fill(Color.gray)
                    .frame(height: 1)
                }
                  
                .padding(.horizontal, 30)
                .padding(.top, 50) */
                
                // because login button is moved 25 in y axis and 25 padding = 50
                
              /*  HStack(spacing: 25){
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("apple")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("fb")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("twitter")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    }
                }
                .padding(.top, 30) */
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
                        Image(systemName: "person.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
              
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("رقم الجوال", text: self.$phoneNo)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                        
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("البريد الإلكتروني", text: self.$email)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                /*PASS FIELD*/
                SecureInputView2("كلمة المرور", text: $pass)
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
                SecureInputView2("تأكيد كلمة المرور", text: $repass)                /*VStack{
                    
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
                        Image(systemName: "person.fill")
                            .foregroundColor(Color("Kcolor"))
                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                    
                        TextField("رقم الجوال", text: self.$phoneNo2)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                        
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("البريد الإلكتروني", text: self.$email2)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                /*PASS FIELD*/
                SecureInputView2("كلمة المرور", text: $pass2)
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
                SecureInputView2("تأكيد كلمة المرور", text: $repass2)                 /*
                VStack{
                    
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
        VStack{
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
                           }
                    .padding(.horizontal)
                    .padding(.top,30)
}
}
