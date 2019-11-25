//
//  MainController.swift
//  MapsDirectionsGooglePlaces
//
//  Created by BOTAO LI on 11/24/19.
//  Copyright © 2019 BOTAO LI. All rights reserved.
//

import UIKit
import MapKit

class MainController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let mapView = MKMapView(frame: view.frame)
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
