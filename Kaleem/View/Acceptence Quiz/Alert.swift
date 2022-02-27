//
//  Alert.swift
//  Kaleem
//
//  Created by Sarah S on 26/07/1443 AH.
//


import SwiftUI
enum AlertAction {
    
    case ok
    case cancel
}
struct CustomAlert: View {
    @Binding var shown: Bool
    @Binding var closureA: AlertAction? 
       // var isSuccess: Bool
    var imgName: String
    var title: String
        var message: String
    
        
        var body: some View {
           
            ZStack{
            VStack {
               
                             
                //Spacer()
                Text(title).foregroundColor(Color.black).fontWeight(.bold).padding(.bottom, 5).padding(.top, 80)
                Text(message).foregroundColor(Color.black)
                Spacer()
               // Divider()
                HStack {
                    //dialog btn 1
                    Button("إلغاء") {
                        closureA = .cancel
                        shown.toggle()
                    }.frame(width: UIScreen.main.bounds.width/2-60, height: 40) // this btn width is consistent with the dialog box width
                        .foregroundColor(.white)
                        .background(Color("Kcolor"))
                        .clipShape(Capsule())
.padding(10)
                    // dialog btn 2
                                            Button("تأكيد") {
                        closureA = .ok
                        shown.toggle()
                    }.frame(width: UIScreen.main.bounds.width/2-60, height: 40) // this btn width is consistent with the dialog box width
                        .foregroundColor(.white)
                        .background(Color("Kcolor"))
                        .clipShape(Capsule())
                        .padding(10)

                }
                
            }
            // dialog
           // .overlay(content: Image(systemName: "checkmark.circle.fill"))
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
            //.background(BlurView())
           // .frame (maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.primary.opacity(0.35).padding(-400))
        }
}

    /*
struct alert_Previews: PreviewProvider {
    static var previews: some View {
        alert()
    }
}*/
