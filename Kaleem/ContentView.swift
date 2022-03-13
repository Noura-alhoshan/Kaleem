//
//  ContentView.swift
//  Kaleem
//
//  Created by نوره سعد on 21/06/1443 AH.
//

import SwiftUI
import MapKit
import Combine

struct ContentView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    //@State private var region = MKCoordinateRegion.defaultRegion
   // @State private var cancellable: AnyCancellable?
    
//    private func setCurrentLocation() {
//        cancellable = locationManager.$location.sink { location in
//            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 500, longitudinalMeters: 500)
//        }
//    }
    
    var body: some View {
        
        
        let coordinate = self.locationManager.location != nil ?
        self.locationManager.location!.coordinate :
        CLLocationCoordinate2D()
        
        return ZStack {
           // MapView()
            Text("\(coordinate.latitude),\(coordinate.longitude)").foregroundColor(Color.white)
                .padding().background(Color.green).cornerRadius(10)
        }}
        }
   //     VStack {
//            if locationManager.location != nil {
//                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil)
//            } else {
//                Text("Locating user location...")
//            }
//        }
//
//        .onAppear {
//            setCurrentLocation()
//        }
 //   }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
