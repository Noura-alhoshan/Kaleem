//
//  PopUp.swift
//  Kaleem
//
//  Created by Sarah S on 18/03/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth
import Combine
import Foundation


struct PopUpWindow: View {

    @EnvironmentObject var session: SessionStore
    @ObservedObject private var PViewModel = ProfileVM()
    @Binding var userEmail: String
    @Binding var userPhone: String
    @Binding var userName: String
    @Binding var userType: String
    
    @State var email: String = ""
    @State var pass: String = ""
    
   // @State var VM = SignUpVM()
    @State var emailErr = ""
    @Binding var show: Bool
    @State var loading = false
    @State var error = false
    @State var showEditForm = false
    
    func checkUser () {
        
        if (email == PViewModel.KaleemUser.email ){
            self.error = false
            
            session.signIn(email: email, password: pass) { (result, error) in
                self.loading = false
                   
                if error != nil {
                    self.error = true
                }
                else {
                    session.signInStraem(email: email, password: pass)
                    self.error = false
                
                    Auth.auth().currentUser?.updateEmail(to: userEmail) { error in
                      print(error)
                    }
                    
                    if (userType == "Impaired") {
                        userType = "Speech-impaired"
                    }
                    
                    
                    Firestore.firestore().collection(userType)
                    .document(Auth.auth().currentUser!.uid).setData(
                        ["name":self.userName,
                          "phoneNo": userPhone,
                            "email": userEmail ], merge: true)
                   // showAlert = true
                   show = false
                }
            
        }
        }//if
        else {
            self.error = true
            print (userEmail)
        }
    }
    
    
    
    
    var body: some View {
     
        ZStack {
            if show {
              
                // PopUp background color
                Color.black.opacity(show ? 0.1 : 0).edgesIgnoringSafeArea(.all)

                // PopUp Window
                VStack(alignment: .center, spacing: 10) {
                   
                    Text("تعديل البيانات الشخصية يتطلب التحقق من الهوية")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45, alignment: .center)
                        .font(Font.system(size: 19, weight: . light))
                        .padding(.top, 20)
                    VStack(alignment: .trailing ){
                        HStack(spacing: 15)  {
                            
                            TextField("البريد الإلكتروني", text: self.$email)
                                .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                .keyboardType(.emailAddress).disableAutocorrection(true)

                            
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("Kcolor"))
                            
                        }
                        Divider().background(Color("Kcolor"))
                        if self.emailErr != "" {
                            Text(self.emailErr)
                                .foregroundColor(.red)
                                .font(.system(size: 12.8))
                        }

                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                
                    
                    VStack{
                    SecureInputView2("كلمة المرور", text: $pass)
                    }
             .padding(.horizontal)
             .padding(.top,30)
                    
                    if (error) {
                               
                        Text("معلومات التحقق غير صحيحة ، حاول مرة أخرى")
                            //.offset(y: -10)
                            .foregroundColor(.red).padding(.top,13)
                    }
                    else {
                        Text(" ").foregroundColor(.red).padding(.top,13)
                    }
                    
                    

                    Button(action: {
                        checkUser()
//                        withAnimation(.linear(duration: 0.3)) {
//                            show = false
//                        }
                    }, label: {
                        Text("حفظ")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal,50)
                            .background(Color("Kcolor"))
                            .clipShape(Capsule())
                            .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
                    })
                        .padding(.top, 18)
                        .padding(.bottom, 20)
                    
                }
                .frame(maxWidth: 370)
                .border(Color.white, width: 2)
                .background(Color(.white))
                .cornerRadius(15)
                .shadow(radius: 4)
                .onAppear(perform: { PViewModel.fetchUser();})
            }
        }
    }
}
