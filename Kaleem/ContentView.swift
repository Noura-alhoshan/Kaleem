//
//  ContentView.swift
//  Kaleem
//
//  Created by نوره سعد on 21/06/1443 AH.
//
/*
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, location!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
import SwiftUI
import CoreLocation
import CoreLocationUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        VStack {
          
                Text(String(locationManager.CalculateDistance()))
 
              //  Text("Your location: \(location.latitude), \(location.longitude)")
            

            LocationButton {
                locationManager.requestLocation()
            }
            .frame(height: 44)
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
