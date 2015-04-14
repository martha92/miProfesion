//
//  ViewControllerDetalle.swift
//  miProfesion
//
//  Created by Martha Garcia Contreras on 12/03/15.
//  Copyright (c) 2015 Martha Garcia Contreras. All rights reserved.
//

import UIKit

class ViewControllerDetalle: UIViewController, CLLocationManagerDelegate {
    var index : Int? = nil
    
    //definir la region beacon
    let regionBeacon:CLBeaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D"), identifier: "Beacon")
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var myArray: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("GeoPList", ofType: "plist") {
            myArray = NSArray(contentsOfFile: path)
        }
        if let arr = myArray {
            // Use your dict here
            var latitud : NSString? = arr[index!].objectForKey("latitud") as? NSString
            var longitud : NSString?  = arr[index!].objectForKey("longitud") as? NSString
            var camera = GMSCameraPosition.cameraWithLatitude(latitud!.doubleValue,
                longitude:longitud!.doubleValue, zoom: 19)
            var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
            mapView.myLocationEnabled = true
            self.view = mapView
            
            var marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(latitud!.doubleValue, longitud!.doubleValue)
            marker.title = arr[index!].objectForKey("nombre") as! String
            marker.snippet = arr[index!].objectForKey("etiqueta") as! String
            marker.map = mapView
            
        }


        // Do any additional setup after loading the view.
        if locationManager.respondsToSelector("requestAlwaysAuthorization") {
            locationManager.requestAlwaysAuthorization()
        }
        
        locationManager.delegate = self;
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startMonitoringForRegion(regionBeacon)
        locationManager.startRangingBeaconsInRegion(regionBeacon)
        locationManager.startUpdatingLocation()
        
        self.regionBeacon.notifyOnEntry=true;
        self.regionBeacon.notifyOnExit=true;
        self.regionBeacon.notifyEntryStateOnDisplay=true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        println("Entered Region \(region.identifier)")

    }
    
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        println("Exited Region \(region.identifier)")
    }

}
