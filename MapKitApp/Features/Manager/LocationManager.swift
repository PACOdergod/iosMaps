//
//  LocationManager.swift
//  MapKitApp
//
//  Created by FAMM on 25/09/23.
//

import Foundation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var locationManager : CLLocationManager?
    
    @Published var region: MKCoordinateRegion?
    @Published var location: CLLocation?
    @Published var error: Error?
    
    override init() {
        super.init()
        requestLocation()
    }
    
    func requestLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            locationManager?.requestWhenInUseAuthorization()
        default:
            locationManager?.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: lastLocation.coordinate, span: span)
            self.region = region
            self.location = lastLocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.error = error
    }
}
