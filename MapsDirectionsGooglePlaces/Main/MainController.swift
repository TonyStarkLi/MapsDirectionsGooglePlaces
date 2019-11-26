//
//  MainController.swift
//  MapsDirectionsGooglePlaces
//
//  Created by BOTAO LI on 11/24/19.
//  Copyright © 2019 BOTAO LI. All rights reserved.
//

import UIKit
import MapKit
import LBTATools

class MainController: UIViewController {
    
    let mapView = MKMapView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.fillSuperview()
        mapView.mapType = .hybrid
    }
}
