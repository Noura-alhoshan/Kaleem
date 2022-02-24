//
//  Location.swift
//  Kaleem
//
//  Created by نوره سعد on 24/07/1443 AH.
//

import Foundation
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("error:: \(error)")
        }
    
    func CalculateDistance() -> Int{
        let userLocation = CLLocation(latitude: location?.latitude ?? 0.0 , longitude: location?.longitude ?? 0.0 )
        let destinationLocation = CLLocation(latitude: 24.683329, longitude:46.78263)// latitude and longitude from the json file
        let distance = userLocation.distance(from: destinationLocation)

        return roundToFive(x: distance)
    }

    private func roundToFive(x : Double) -> Int {
        
        return 5 * Int(round(x / 5.0))
    }
        
}

