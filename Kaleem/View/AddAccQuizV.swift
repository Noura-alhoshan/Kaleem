//
//  AddAccQuizV.swift
//  Kaleem
//
//  Created by Sarah S on 19/07/1443 AH.
//

import SwiftUI
//import UIKit


struct AddAccQuizV: View {
//      var title: String
//      var address: String
//      var city: String
//      var categories: [String]
//      var kilometres: Double
    @ObservedObject private var viewModel = ContactViewModel()
    
    
      var body: some View {
          
          List(viewModel.contacts) { Qmodel in
          ZStack(alignment: .trailing) {
              
             // Color.flatDarkCardBackground
              HStack {
                  ZStack {
                      //Circle()
                        //  .fill(
                            AsyncImage(url: URL(string: Qmodel.question) ,scale: 5.0).frame(width: 230, height: 150 )
                              
                        //  )
//
//                      VStack {
//                          Text(Qmodel.)
//                              .font(.system(size: 20, weight: .bold))
//                              .foregroundColor(.white)
//
//                          Text("km")
//                              .font(.caption)
//                              .foregroundColor(.white)
//                      }
  }
                  .frame(width: 70, height: 70, alignment: .center)
                  
                  VStack(alignment: .trailing) {
                      Text("ماذا تعني هذه الإشارة؟")
                          .font(.headline)
                          .fontWeight(.bold)
                          .lineLimit(2)
                          .padding(.bottom, 5)
                      
//                      Text("ماذا تعني هذه الإشارة؟")
//                          .padding(.bottom, 5)
                      
                      HStack(alignment: .center) {
                          Text(Qmodel.correctAnswer)
                          Image(systemName: "checkmark").font(.title.weight(.semibold)) .foregroundColor(.green)
                          
                      }
                      .padding(.bottom, 5)
                      
//                      HStack {
//                          ForEach(categories, id: \.self) { category in
//                              CategoryPill(categoryName: category)
//                          }
                      //}
                      
                  }
                  .padding(.horizontal, 5)
              }
              .padding(15)
          }
          .clipShape(RoundedRectangle(cornerRadius: 15))//.listStyle(InsetGroupedListStyle())
      }.onAppear() {
          self.viewModel.fetchData()
      }
  }
}


struct AddAccQuizV_Previews: PreviewProvider {
    static var previews: some View {
        AddAccQuizV()
    }
}
