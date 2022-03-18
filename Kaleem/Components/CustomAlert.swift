//
//  alert.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 17/07/1443 AH.
//

import SwiftUI
enum AlertAction {
    
    case ok
    case cancel
}
struct CustomAlert: View {
    @Binding var shown: Bool
    @Binding var closureA: AlertAction?
    var oneBtn: Bool

       // var isSuccess: Bool
    var imgName: String
    var title: String
    var message: String
    var btn1: String
    var btn2: String

//     for navigation to SignIn
    @Binding var showNextPage2 : Bool


    var body: some View {
       NavigationLink(destination: SignIn(), isActive: $showNextPage2, label: {EmptyView()} )

            ZStack{
            VStack {
               
                             
                //Spacer()
                Text(title).foregroundColor(Color.black).fontWeight(.bold).padding(.bottom, 5).padding(.top, 80)
                Text(message).foregroundColor(Color.black)
                Spacer()
               // Divider()
                HStack {
                    //dialog btn 2 > cancel
                  
                    Button(btn1) {
                        closureA = .cancel
                        shown.toggle()
                        print("BOOLEAN#######: \(showNextPage2)")

                        showNextPage2 = true
                    }.frame(width: UIScreen.main.bounds.width/2-60, height: 40) // this btn width is consistent with the dialog box width
                        .foregroundColor(.white)
                        .background(Color("Kcolor"))
                        .clipShape(Capsule())
.padding(10)
                
                    // dialog btn 1 > ok
                    if (!oneBtn)
                    {
                    Button(btn2) {
                        closureA = .ok
                        print("BOOLEAN SHown 62#######: \(shown)")

                        shown.toggle()

                    }.frame(width: UIScreen.main.bounds.width/2-60, height: 40) // this btn width is consistent with the dialog box width
                        .foregroundColor(.white)
                        .background(Color("Kcolor"))
                        .clipShape(Capsule())
                        .padding(10)
                }
                }
                
            }
            // dialog
            .frame(width: UIScreen.main.bounds.width-50, height: 200)
            .background(Color.white)
            .cornerRadius(12)
            .clipped()
            
            VStack{
                Image(systemName: "checkmark.circle.fill").resizable().frame(width: 100, height: 100)//.cornerRadius(100)
                    .background(Color.white.cornerRadius(50))
               .overlay(Circle()
                           .stroke(Color.white, lineWidth: 6)).foregroundColor(Color("Kcolor")).padding(.bottom, 180)
       }
            
        }

            .background(
                Color.primary.opacity(0.35)
                    .padding(-400)
            )
        }
}

    /*
struct alert_Previews: PreviewProvider {
    static var previews: some View {
        alert()
    }
}*/
