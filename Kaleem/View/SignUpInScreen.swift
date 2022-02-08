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
                VStack {
                 
                   
                    
                    Image("KaleemFinalLogo").resizable().aspectRatio( contentMode: .fit)
               
                 //   PrimaryButton(title: "Get Started")
                        .padding(.bottom,100)
                    NavigationLink(
                        destination: SignUpInScreen().navigationBarHidden(true),
                        label: {
                            Text("الانضمام لكليم !")
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
                        destination: SignUpInScreen().navigationBarHidden(true),
                        label: {
                            Text("تسجيل الدخول")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color("Color"))
                                .padding()
                                .frame(width: 300)
                                .background(Color("HandColor"))
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
