////
////  ForgotPassword.swift
////  Kaleem
////
////  Created by Sarah S on 27/06/1443 AH.


import SwiftUI
import FirebaseAuth

struct ForgotPassword : View{
    
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
            
            GeometryReader{_ in
                
                VStack{
                      //  TopBar()
             
                  
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
                    
                        
                         if (error) {
                                    
                             Text("البريد الإلكتروني غير صحيح ، حاول مرة أخرى")
                                 .foregroundColor(.red).padding(.top,13)
                         }
                         else {
                             Text(" ").foregroundColor(.red).padding(.top,13)
                         }
                         
                        
                 
                        
                
                    } // the big one
       
                    
                    /*CONTAINER*/
                    .padding()
                    .padding(.bottom, 9)
                    
                    /*WITHIT OR WITHOUT IT?*/
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal,20)
                    
                    /*BUTTON*/
                    Button(action: forgotPassword){
                        Text("إرسال")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal,50)
                            .background(Color("Kcolor"))
                            .clipShape(Capsule())
                            .shadow(color: Color.red.opacity(0.1), radius:5 , x: 0, y: 5)
                    } .alert(isPresented: $showAlert) {
                        
                        Alert(
                            title: Text("تمت العملية بنجاح"),
                            message: Text("تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني"),
                            dismissButton: .default(
                                            Text("إغلاق"),
                                            action: { self.mode.wrappedValue.dismiss() })
                        )
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
struct ForgotPass_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
