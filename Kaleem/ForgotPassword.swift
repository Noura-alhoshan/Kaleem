////
////  ForgotPassword.swift
////  Kaleem
////
////  Created by Sarah S on 27/06/1443 AH.


import SwiftUI
import FirebaseAuth



struct ForgotPasswordForm: View {
    
        @Environment(\.presentationMode) var mode: Binding<PresentationMode>
        @State var email: String = ""
        @State var loading = false
        @State var error = false
        @State var showAlert: Bool = false

       

        func forgotPassword () {
            
            loading = true
            error = false
            email = email.trimmingCharacters(in: .whitespaces)
            Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                self.loading = false
                   
                if error != nil {
                    self.error = true
                }
                else {
                    //alert message
                    self.showAlert = true
                }
            }
        }
    
    
    var body: some View {
               
        VStack {
            VStack(alignment: .center) {
                ForgotText().padding(.bottom,55)
                //UserImage()
              // TextField( $email)
               
                if (error) {
                           
                    Text("البريد الإلكتروني غير صحيح ، الرجاء المحاولة مرة أخرى")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
               
        
                
                
               Button(action: forgotPassword) {
                   ForgotButtonContent()
                }
               .alert(isPresented: $showAlert) {

               Alert(
                   title: Text("تمت العملية بنجاح"),
                   message: Text("تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني"),
                   dismissButton: .default(
                                   Text("إغلاق"),
                                   action: { self.mode.wrappedValue.dismiss() })
               )
               }
                
               
            }.padding(.bottom,140)
                .padding()

        }
    }

    
    }

struct ForgotText: View {
    var body: some View {
        Text(" إعادة تعيين كلمة المرور")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}


struct ForgotButtonContent: View {
    var body: some View {
        Text("إرسال")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}
