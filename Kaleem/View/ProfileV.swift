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
    // let gradient = Gradient(colors: [.blue, .purple])
    
    
    var body: some View {
        
        NavigationLink(destination: EditProfileV(username: PViewModel.KaleemUser.name, phoneNo: PViewModel.KaleemUser.phoneNo, email: PViewModel.KaleemUser.email) , isActive: $showEditForm, label: {EmptyView()} )
        
        
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
                // .background(Color.black.opacity(0.4))
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
                            Text("المعلومات الشخصية")
                                .foregroundColor(.black).opacity(0.7)
                                .font(.title2)
                            // .fontWeight(.bold)
                        }
                        
                        
                        VStack(alignment: .trailing ){
                            HStack(spacing: 15)  {
                                Text(PViewModel.KaleemUser.name)
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
                                Text(PViewModel.KaleemUser.phoneNo)
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
                                Text(PViewModel.KaleemUser.email)
                                // Text("البريد الإلكتروني:" )
                                
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(Color("Kcolor"))
                                
                            }
                            Divider().background(Color(.gray).opacity(0.1))
                        }
                        
                        .padding(.horizontal)
                        .padding(.top,20)
                        
                        //Spacer()
                    } // the big one
                    /*CONTAINER*/
                    .padding()
                    .padding(.bottom, 30)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal,20)
                    // .padding(.vertical,20)
                    .onAppear(perform: { PViewModel.fetchUser()} )
                    
                    
                    Button(action: {
                        showEditForm = true
                    }) {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("Kaleem"))
                            .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                    }
                    .padding()
                }
                
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
