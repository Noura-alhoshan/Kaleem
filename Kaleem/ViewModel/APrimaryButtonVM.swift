//
//  PrimaryButton.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//

import SwiftUI

struct APrimaryButtonVM: View {
    var text: String
    var background: Color = Color("Kaleem")
    
    var body: some View {
        Text(text)      .foregroundColor(Color.white)
            .fontWeight(.bold)
            .padding()
            .padding(.horizontal)
            .background(background)
           // .clipShape(Capsule())
                  .cornerRadius(30)

            .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
//            .foregroundColor(.white)
//            .padding()
//            .padding(.horizontal)
//            .background(background)
//            .cornerRadius(30)
//            .shadow(radius: 10)
    }
}

struct APrimaryButtonVM_Previews: PreviewProvider {
    static var previews: some View {
        APrimaryButtonVM(text: "التالي")
    }
}
