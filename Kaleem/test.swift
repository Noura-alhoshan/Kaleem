//
//  test.swift
//  Kaleem
//
//  Created by نوره سعد on 10/08/1443 AH.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct testView: View {
   // @Published private(set) var score = 0
    @StateObject var locationManager = LocationManager()
    @State var showhos: Bool = false
    @State var showuni: Bool = false



    var body: some View {
        NavigationView{

        VStack {

             NavigationLink(destination: hosView(), isActive: $showhos, label: {EmptyView()} )
            
            NavigationLink(destination: uniView(), isActive: $showuni, label: {EmptyView()} )

            LocationButton {
              locationManager.requestLocation()
         
            action: do {
                if(locationManager.CalculateHospitalDistance()<1000  && locationManager.CalculateHospitalDistance()>1.1 ){
                self.showhos = true
                }
                else{
                 //   if(locationManager.CalculateUniDistance()<1000  && locationManager.CalculateHospitalDistance()>1.1 ){
                    self.showuni = true
                    
                }
                   // }
                
                locationManager.requestLocation()
                print(String(locationManager.CalculateHospitalDistance()))

                }
            }
           // .frame(  width: 100, height: 100)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .cornerRadius(150)
            .labelStyle(.iconOnly)
            .tint(.blue)


            }
    }}
}
