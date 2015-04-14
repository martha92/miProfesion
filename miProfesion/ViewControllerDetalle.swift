//
//  ViewControllerDetalle.swift
//  miProfesion
//
//  Created by Martha Garcia Contreras on 12/03/15.
//  Copyright (c) 2015 Martha Garcia Contreras. All rights reserved.
//

import UIKit

class ViewControllerDetalle: UIViewController {
    var index : Int? = nil
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
