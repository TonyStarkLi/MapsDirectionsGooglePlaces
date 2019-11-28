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
        
        mapView.delegate = self
        
        view.addSubview(mapView)
        mapView.fillSuperview()
        
        setupRegionForMap()
        
        performLocalSearch()
//        setupAnnotationsForMap()
    }
    
    fileprivate func performLocalSearch() {
        let request = MKLocalSearch.Request()
        // This two has to specify
        request.naturalLanguageQuery = "airport"
        request.region = mapView.region
        let localSearch = MKLocalSearch(request: request)
        localSearch.start { (resp, err) in
            if let err = err {
                print("Failed local search: ", err)
                return
            }
            
            // Success
            resp?.mapItems.forEach({ (mapItem) in
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = mapItem.placemark.coordinate
                annotation.title = mapItem.name
                self.mapView.addAnnotation(annotation)
                
            })
            
            self.mapView.showAnnotations(self.mapView.annotations, animated: true)
        }
    }
    
    fileprivate func setupAnnotationsForMap() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 40.7, longitude: -73.9)
//        annotation.title = "san"
        mapView.addAnnotation(annotation)
        mapView.showAnnotations(self.mapView.annotations, animated: true)
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

extension MainController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // Custom pin
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "id")
        return annotationView
    }
}
