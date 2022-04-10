//
//  ProfileView.swift
//  Kaleem
//
//  Created by Sarah S on 15/03/2022.
//

import SwiftUI
import Combine
import Foundation
import Firebase
import FirebaseAuth

struct EditProfileV: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject private var PViewModel = ProfileVM()
    @State var VM = SignUpVM()
    @State var username: String
    @State var phoneNo: String
    @State var email: String
    @State var type: String
    @State var usernameErr = ""
    @State var emailErr = ""
    @State var phoneNoErr = ""
    @State var isError = false
    @State var showAlert = false
    @State var showCheckForm = false
    
    
    func updataInfo(){
        
        
        if (usernameErr != "" || emailErr != "" || phoneNoErr != "" ){
            isError = true
        }
        else {
            isError = false
            showCheckForm = true//call the pop up
            
        }
    }
    
    
    var body: some View {
        
        
        HStack{
            Spacer()
            Button(action: {
                withAnimation(.easeInOut){
                    self.mode.wrappedValue.dismiss()
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color("Color"))
                    .cornerRadius(10)
                
            }).padding(.horizontal,25)
        } .padding(.bottom, 80)
        
        GeometryReader{_ in
            VStack{
                HStack {
                    Spacer()
                    
                    VStack {
                        Image("Default user")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                            .clipped()
                            .overlay(Circle().stroke(Color.white, lineWidth: 0))
                        
                    }
                    Spacer()
                }.cornerRadius(20)
                
                
                
                
                ZStack(alignment: .bottomLeading) {//to hold the floating + button
                    
                    VStack{
                        HStack{
                            Text("تعديل المعلومات الشخصية")
                                .foregroundColor(.black).opacity(0.7)
                                .font(.title2)
                        }
                        
                        
                        VStack(alignment: .trailing ){
                            HStack(spacing: 15)  {
                                
                                TextField("الاسم الكامل", text: self.$username)
                                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing).disableAutocorrection(true)
                                    .onChange(of: self.username, perform: {newValue in self.usernameErr = VM.validateUserName(username: self.username)})
                                
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("Kcolor"))
                                
                            }
                            Divider().background(Color("Kcolor"))
                            
                            if self.usernameErr != "" {
                                Text(self.usernameErr)
                                    .foregroundColor(.red)
                                    .font(.system(size: 12.8))
                                // .padding()
                                    .multilineTextAlignment(TextAlignment.trailing)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top,20)
                        
                        
                        VStack(alignment: .trailing ){
                            HStack( spacing: 15)  {
                                
                                TextField("رقم الجوال", text: self.$phoneNo)
                                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                    .onChange(of: self.phoneNo, perform: {newValue in self.phoneNoErr = VM.validatePhoneNo(phone: self.phoneNo)})
                                
                                Image(systemName: "phone.fill")
                                    .foregroundColor(Color("Kcolor"))
                                
                            }
                            Divider().background(Color("Kcolor"))
                            
                            if self.phoneNoErr != "" {
                                Text(self.phoneNoErr)
                                    .foregroundColor(.red)
                                    .font(.system(size: 12.8))
                                
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top,20)
                        
                        
                        VStack(alignment: .trailing ){
                            HStack(spacing: 15)  {
                                
                                TextField("البريد الإلكتروني", text: self.$email)
                                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                    .keyboardType(.emailAddress).disableAutocorrection(true)
                                    .onChange(of: self.email, perform: { newValue in
                                        self.emailErr = VM.validateEmail(email: self.email)
                                        
                                        // check if the user already use this email from th DB
                                        VM = SignUpVM(email: self.email)
                                        VM.isEmailExisted(handler: { status, msg in
                                            if !status {
                                                self.emailErr = "*البريد الالكتروني مسجل مسبقا"
                                            } else {
                                                self.emailErr = ""
                                            }
                                        })// END check
                                        
                                    })
                                
                                
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
                        
                        if (isError) {
                            
                            Text("الرجاء التحقق من صحة جميع البيانات")
                            //.offset(y: -10)
                                .foregroundColor(.red).padding(.top,13)
                        }
                        else {
                            Text(" ").foregroundColor(.red).padding(.top,13)
                        }
                        
                        if (!showCheckForm ){//عشان ما يطلع شكل الازرار مكرر في الصفحة وفي البوب اب
                            Button(action: {
                                
                                updataInfo()
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
                        }
                        //Spacer()
                    } // the big one
                    /*CONTAINER*/
                    .padding()
                    .padding(.bottom, 20)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal,20)
                    // .padding(.vertical,20)
                    .onAppear(perform: {
                        PViewModel.fetchUser()
                        
                    } )
                    
                }
                
            }.navigationBarTitle("")
                .navigationBarHidden(true)
            
            PopUpWindow(userEmail: $email, userPhone: $phoneNo, userName: $username, userType: $type, show: $showCheckForm )
        }
        
    }
}

