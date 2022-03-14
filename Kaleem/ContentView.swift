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
    @State var showTest: Bool = false


    var body: some View {
        VStack {
            
        //    NavigationView{
           //  NavigationLink(destination: testView(), isActive: $showTest, label: {EmptyView()} )
        
            
         //   LocationButton {
         //     locationManager.requestLocation()
               // self.showResetPassword = true
//            action: do {
//                locationManager.requestLocation()
//
//                self.showTest = true}
     //       }
     //       .frame(height: 44)
      //      .padding()
            
    
            
                
           
            
            
            
            
            
            
            if(locationManager.CalculateHospitalDistance()<1000  && locationManager.CalculateHospitalDistance()>1.1 ){
                       Text(String(locationManager.CalculateHospitalDistance()))
                Text("you are in hospital")
                Text("you are in hospital")


            }
            else
                if(locationManager.CalculateUniDistance()<1000  && locationManager.CalculateHospitalDistance()>1.1 ){
                    Text(String(locationManager.CalculateUniDistance()))
             Text("you are in uni")
                }
            else
                if(locationManager.CalculateUniDistance()==0.0 || locationManager.CalculateHospitalDistance()==0.0 ){
                    Text(String(locationManager.CalculateUniDistance()))
             Text("لاظهار الجمل المساعدة الرجاء السماح بالموقع في الزر في الاسفل ")
                }
            else
                
            {             Text("نعتذر موقعك الحالي غير مضاف حاليا")
}
           // NavigationLink(destination: testView(), isActive: $showTest, label: {EmptyView()} )
          
         //       Text(String(locationManager.CalculateHospitalDistance()))
 
             //   Text("Your location: \(location.latitude), \(location.longitude)")
            

         
            
//            NavigationLink {
//
//                testView()
//
//            } label: {   Text("Your")     }.onTapGesture {
//                             }.background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))

            
//            LocationButton {
//                     locationManager.requestLocation()
//                     //  self.showTest = true
//                                print(String(locationManager.CalculateHospitalDistance()))
//
//                   }
//            .frame(width: 100, height: 100)
//                     .cornerRadius(100)
//                     .labelStyle(.iconOnly)
//                     .symbolVariant(.fill)
//                     .foregroundColor(.white)
        }
        }
   // }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
