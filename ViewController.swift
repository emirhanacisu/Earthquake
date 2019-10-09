//
//  ViewController.swift
//  Earthquake
//
//  Created by Erhan Acisu on 9.10.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import UIKit
import  Firebase
import  MapKit



class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
 var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
       
       locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
      
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        print(location.latitude)
        print(location.longitude)
    }

}

