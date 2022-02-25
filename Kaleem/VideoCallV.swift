//
//  VideoCallV.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 24/07/1443 AH.
//

import Foundation
 import SwiftUI

struct VideoCallV: View {

 @ObservedObject private var viewModel = VideoCallVM()

    var body: some View {
       NavigationView {
           List(viewModel.volunteers) { voluntter in
              VStack(alignment: .leading) {
                Text(voluntter.username).font(.title)
                 Text(voluntter.phoneNo).font(.subheadline)

                                         }
           }.navigationBarTitle("Volunteers")
               .onAppear(){
                   self.viewModel.fetchData()
               }
       }
    }
}
