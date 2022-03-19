//
//  SignUpInScreen.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 07/07/1443 AH.
//

import SwiftUI

struct NoLocation: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                self.mode.wrappedValue.dismiss()
                                withAnimation(.easeInOut){
                                  
                                }
                            }, label: {
                                Image(systemName: "chevron.right")
                                     .foregroundColor(.white)
                                     .padding(.vertical,10)
                                     .padding(.horizontal)
                                    // .background(Color.black.opacity(0.4))
                                     .background(Color("Kcolor"))
                                     .cornerRadius(10)
                            }).padding(.horizontal,25)

        }
        
  
      
            
          
            VStack {
                Color("AppIcon").edgesIgnoringSafeArea(.all) // THIS cause an error =========
                // Color.gray.edgesIgnoringSafeArea(.all)
          
                VStack {
                    
//                    Image("KaleemFinalLogo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 270.0, height: 190.0)
//
//                    //   PrimaryButton(title: "Get Started")
//                        .padding(.bottom,20)
                    NavigationLink(
                        destination: SignUpTaps().navigationBarHidden(true),
                        label: {
                          Text("أنت بالبيت !")
                                .font(Font.custom("Almarai-Bold", size: 20))
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(width: 300)
                                .background(Color("Color"))
                                .cornerRadius(50.0)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)
                        }
                    )
                   
                }
              
              
            }  .navigationBarTitle("")
                .navigationBarHidden(true)
        
        
    }
}

