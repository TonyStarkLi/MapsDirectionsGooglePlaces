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
import SwiftUI

class MainController: UIViewController {
    
    let mapView = MKMapView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.fillSuperview()
        
        setupRegionForMap()
    }
    
    fileprivate func setupRegionForMap() {
        let coordinate = CLLocationCoordinate2D(latitude: 40.7, longitude: -73.9)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}

// Swift UI Preview
struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    /*
     In order to display view controller in the preview, we need to creat a container view
     to contain the view controller
     */
    struct ContainerView: UIViewControllerRepresentable {
        
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> MainController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainController, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
        
        
        typealias UIViewControllerType = MainController
        
    }
}
