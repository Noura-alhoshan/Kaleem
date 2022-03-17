//
//  test.swift
//  Kaleem
//
//  Created by نوره سعد on 10/08/1443 AH.
//

import SwiftUI
//import CoreLocation
import CoreLocationUI

struct testView: View {
   // @Published private(set) var score = 0
    @StateObject var locationManager = LocationManager()
    @State var showhos: Bool = false
    @State var showuni: Bool = false
    @State var showcoffe: Bool = false
    @State var showNoResult: Bool = false



    var body: some View {
        NavigationView{

        VStack {

             NavigationLink(destination: hosView(), isActive: $showhos, label: {EmptyView()} )
            
            NavigationLink(destination: uniView(), isActive: $showuni, label: {EmptyView()} )

            NavigationLink(destination: coffeView(), isActive: $showcoffe, label: {EmptyView()} )
            
            NavigationLink(destination: NoResultView(), isActive: $showNoResult, label: {EmptyView()} )


            LocationButton {
              locationManager.requestLocation()

            action: do {
                if(locationManager.CalculateHospitalDistance() != 1.0 ){
                self.showhos = true
                }
                else
                    if(locationManager.CalculateUniDistance() != 1.0 ){
                    self.showuni = true
                }
                else
                    if(locationManager.CalculateCoffeDistance() != 1.0 ){
                    self.showcoffe = true
                }
                    else{
                        self.showNoResult = true}


                locationManager.requestLocation()
                print(String(locationManager.CalculateHospitalDistance()))

                }
            }
           // .frame(  width: 900, height: 950)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .cornerRadius(50.0)
            .labelStyle(.iconOnly)
            .tint(.blue).font(.largeTitle)


            }
    }}
}
