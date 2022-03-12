//
//  Location.swift
//  Kaleem
//
//  Created by نوره سعد on 24/07/1443 AH.
//
///*
import Foundation
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?
    @Published private(set) var hos = 0.0




    override init() {
        super.init()
        manager.delegate = self
        self.hos = CalculateHospitalDistance()
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
    
    func CalculateHospitalDistance() -> Double{
        let userLocation = CLLocation(latitude: location?.latitude ?? 0.0 , longitude: location?.longitude ?? 0.0 )
        let destinationLocation = CLLocation(latitude: 24.6855, longitude:46.7756)// latitude and longitude from the json file
        let distance = userLocation.distance(from: destinationLocation)

        return  distance
    }
    
    func CalculateUniDistance() -> Double{
        let userLocation = CLLocation(latitude: location?.latitude ?? 0.0 , longitude: location?.longitude ?? 0.0 )
        let destinationLocation = CLLocation(latitude: 44.6855, longitude:46.7756)// latitude and longitude from the json file
        let distance = userLocation.distance(from: destinationLocation)

        return  distance
    }

//    private func roundToFive(x : Double) -> Int {
//
//        return 5 * Int(round(x / 5.0))
//    }
//
}

// */
