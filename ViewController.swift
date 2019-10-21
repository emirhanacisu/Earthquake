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
 
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var ref : DocumentReference? = nil
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        //
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region,animated : true)
        print(locations[0].coordinate.latitude)
        print(locations[0].coordinate.longitude)
         ref = db.collection("locations").addDocument(data: ["latitude" : locations[0].coordinate.latitude, "longitude" : locations[0].coordinate.longitude])
      
        
        
    }

}

