//
//  SignUpInScreen.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 07/07/1443 AH.
//

import SwiftUI

struct SignUpInScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("AppIcon").edgesIgnoringSafeArea(.all)
               // Color.gray.edgesIgnoringSafeArea(.all)
                VStack {
                 
                   
                    
                    Image("KaleemFinalLogo")  .resizable()
                        .scaledToFit()
                        .frame(width: 270.0, height: 190.0)
                        .padding(.top, -55)
                 //   PrimaryButton(title: "Get Started")
                        .padding(.bottom,20)
                    NavigationLink(
                        destination: SignUpTaps().navigationBarHidden(true),
                        label: {
                            Text("الانضمام لكليم !")
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
                    
                    NavigationLink(
                        destination: SignIn().navigationBarHidden(true),
                        label: {
                            Text("تسجيل الدخول")
                                .font(Font.custom("Almarai-Regular", size: 20))
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color("Color"))
                                .padding()
                                .frame(width: 300)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(50.0)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)
                        }
                    )
                        .navigationBarHidden(true)
                    
                }
                .padding()
            }
        }
    }
}

struct SignUpInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpInScreen()
    }
}
