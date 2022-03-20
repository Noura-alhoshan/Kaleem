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
  //  @State var emailFromPV = ""
    // let gradient = Gradient(colors: [.blue, .purple])
    
    
    var body: some View {
        
    
        
        GeometryReader{_ in
            
            
                NavigationLink(destination: EditProfileV(username: PViewModel.KaleemUser.name, phoneNo: PViewModel.KaleemUser.phoneNo, email: PViewModel.KaleemUser.email, type: PViewModel.KaleemUser.type) , isActive: $showEditForm, label: {EmptyView()} )
            
//        HStack{
//            Spacer()
//            Button(action: {
//                withAnimation(.easeInOut){
//                    self.mode.wrappedValue.dismiss()
//                }
//            }, label: {
//                Image(systemName: "chevron.right")
//                    .foregroundColor(.white)
//                    .padding(.vertical,10)
//                    .padding(.horizontal)
//                    .background(Color("Color"))
//                    .cornerRadius(10)
//                
//            }).padding(.horizontal,25)
//        } .padding(.bottom, 50)
            
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
                    .padding(.bottom, 40)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal,20)
                    // .padding(.vertical,20)
                    .onAppear(perform: { PViewModel.fetchUser();
                       // emailFromPV =  PViewModel.KaleemUser.email;
                       // print (PViewModel.KaleemUser.email)
                        
                    } )
                    
              
                    
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
                    .padding(.leading,20)
                    .padding(.top, 20)
                }//zstack??
                
                
                
                Button(action: {
                    session.signOut()
                }, label: {
                    Text("تسجيل الخروج")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal,50)
                        .background(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
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
