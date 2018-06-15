//
//  ViewController.swift
//  exercicio0902
//
//  Created by Jackson on 15/06/2018.
//  Copyright © 2018 Targettrust. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var MapV: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MapV.mapType = MKMapType.standard
        let location = CLLocationCoordinate2D(latitude: -30.03041133677187,longitude: -51.235319686264397)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        MapV.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Titulo"
        annotation.subtitle = "Subtitulo"
        MapV.addAnnotation(annotation)
        
    }


}

