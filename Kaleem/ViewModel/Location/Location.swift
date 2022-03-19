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
    
    
    
    
    
    func CalculateHospitalDistance() -> Double{
        let userLocation = CLLocation(latitude: location?.latitude ?? 0.0 , longitude: location?.longitude ?? 0.0 )
        let destinationLocation1 = CLLocation(latitude: 24.68865004807614, longitude:46.703774565496275) // King Fahad Medical
        let destinationLocation2 = CLLocation(latitude: 24.70459610287328, longitude:46.67744540115881) // Alhabib King Fahad road
        let destinationLocation3 = CLLocation(latitude: 24.628400468362557, longitude:46.69022789552085) // King Saud Medical
        let distance1 = userLocation.distance(from: destinationLocation1)
        let distance2 = userLocation.distance(from: destinationLocation2)
        let distance3 = userLocation.distance(from: destinationLocation3)
        
        if distance1 < 500{
            return  distance1}
              else
                  if distance2 < 200{
                      return  distance2}
                        else
                           if distance3 < 300{
                               return  distance3}
                                 else{ return 1.0 }

    }
    
    
    
    
    
    
    func CalculateUniDistance() -> Double{
        let userLocation = CLLocation(latitude: location?.latitude ?? 0.0 , longitude: location?.longitude ?? 0.0 )
        let destinationLocation1 = CLLocation(latitude: 24.726209161952813, longitude:46.62404927434713) // ksu
        let destinationLocation2 = CLLocation(latitude:  24.81192813475351, longitude:46.70121630958766) // Imam
        let destinationLocation3 = CLLocation(latitude: 24.735278173360683, longitude:46.701704545511134) // Sultan
        let distance1 = userLocation.distance(from: destinationLocation1)
        let distance2 = userLocation.distance(from: destinationLocation2)
        let distance3 = userLocation.distance(from: destinationLocation3)
        
        if distance1 < 1500{
            return  distance1}
              else
                  if distance2 < 1500{
                      return  distance2}
                        else
                           if distance3 < 1000{
                               return  distance3}
                                 else{ return 1.0 }
    }
    
    func CalculateCoffeDistance() -> Double{
        let userLocation = CLLocation(latitude: location?.latitude ?? 0.0 , longitude: location?.longitude ?? 0.0 )
        let destinationLocation1 = CLLocation(latitude: 24.70236362434881, longitude:46.69723618479943) // sociale cafe
        let destinationLocation2 = CLLocation(latitude: 24.825441246422553, longitude:46.66147685408667) // Urban Grind
        let destinationLocation3 = CLLocation(latitude: 24.683071441697393, longitude:46.78716729813431) // IV speciality cafe
        let distance1 = userLocation.distance(from: destinationLocation1)
        let distance2 = userLocation.distance(from: destinationLocation2)
        let distance3 = userLocation.distance(from: destinationLocation3)
        
        if distance1 < 50{
            return  distance1}
              else
                  if distance2 < 50{
                      return  distance2}
                        else
                           if distance3 < 50{
                               return  distance3}
                                 else{ return 1.0 }
    }

//    private func roundToFive(x : Double) -> Int {
//
//        return 5 * Int(round(x / 5.0))
//    }
//
}

// */
