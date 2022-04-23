//
//  ProfileView.swift
//  Kaleem
//
//  Created by Sarah S on 15/03/2022.
//

import SwiftUI
import Combine
import Foundation

struct ProfileView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject private var PViewModel = ProfileVM()
    @State var showEditForm = false
    @EnvironmentObject var session: SessionStore
    @State var showingAlert = false

    
    var body: some View {
        
    
        
        GeometryReader{_ in
            
            
            NavigationLink(destination: EditProfileV(username: PViewModel.KaleemUser.name, phoneNo: PViewModel.KaleemUser.phoneNo, email: PViewModel.KaleemUser.email, type: PViewModel.KaleemUser.type,userID: PViewModel.KaleemUser.id) , isActive: $showEditForm, label: {EmptyView()} )
            
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
        } .padding(.bottom, 50)
            
           // Spacer(minLength: 30)
        
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
                    .padding(.top,70)
                
                
                
                
       
                    VStack{
                        HStack{
                            Text("المعلومات الشخصية")
                                .foregroundColor(.black).opacity(0.7)
                                .font(.title2)
                            // .fontWeight(.bold)
                        }
                        
                        
                        VStack(alignment: .trailing ){
                            HStack(spacing: 15)  {
                                Text(PViewModel.KaleemUser.name).foregroundColor(.black.opacity(0.7))
                                //  Text("الاسم:" )
                                
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("Kcolor"))
                                
                            }
                            Divider().background(Color(.gray).opacity(0.01))
                        }
                        .padding(.horizontal)
                        .padding(.top,20)
                        
                        
                        VStack(alignment: .trailing ){
                            HStack( spacing: 15)  {
                                Text(PViewModel.KaleemUser.phoneNo).foregroundColor(.black.opacity(0.7))
                                // Text("رقم الجوال:" )
                                
                                Image(systemName: "phone.fill")
                                    .foregroundColor(Color("Kcolor"))
                                
                            }
                            Divider().background(Color(.gray).opacity(0.01))
                            
                        }
                        .padding(.horizontal)
                        .padding(.top,20)
                        
                        
                        VStack(alignment: .trailing ){
                            HStack(spacing: 15)  {
                                Text(PViewModel.KaleemUser.email).foregroundColor(.black.opacity(0.7))
                                // Text("البريد الإلكتروني:" )
                                
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(Color("Kcolor"))
                                
                            }
                            Divider().background(Color(.gray).opacity(0.0))
                        }
                        
                        .padding(.horizontal)
                        .padding(.top,20)
                    
                    Button(action: {
                            showEditForm = true
                        }) {
                        Text("تعديل")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal,50)
                            .background(Color("Kcolor"))
                            .clipShape(Capsule())
                            .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
                    }
                       .padding(.top, 26)
                    
                        //Spacer()
                    }
                    /*CONTAINER*/
                    .padding()
                    .padding(.bottom, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal,20)
                    // .padding(.vertical,20)
                    .onAppear(perform: { PViewModel.fetchUser();
                       // emailFromPV =  PViewModel.KaleemUser.email;
                       // print (PViewModel.KaleemUser.email)
                        
                    } )
                    
                
                
                
                Button(action: {
                    showingAlert = true
                }, label: {
                    Text("تسجيل الخروج")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal,50)
                        .background(Color(.gray).opacity(0.9))
                        .clipShape(Capsule())
                        .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
                })
                    .padding(.top, 28)
                    .alert("هل أنت متأكد من تسجيل الخروج؟", isPresented: $showingAlert, actions: {
                          Button("نعم", action: {session.signOut()})
                          Button("لا", role: .cancel, action: {})
                        })
                
            }.navigationBarTitle("")
                .navigationBarHidden(true)
       
        }
      
    }
}


extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
