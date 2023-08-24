//
//  ViewController.swift
//  demoMapApp2
//
//  Created by IZIY on 8/23/23.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    let mapView = MKMapView()
    
    func setupMapView(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom pin")
        annotationView.image = UIImage(named: "iconMapPin48")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    func addCustomAnnotation () {
        let missionDoloresCoor = CLLocationCoordinate2D(latitude: 35.78972, longitude: 51.46616)
        let pin = CustomAnnotation(coor: missionDoloresCoor)
        pin.title = "dibaji"
        mapView.addAnnotation(pin)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "map View"
        view.addSubview(mapView)
        setupMapView()
        
        //
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance:2000000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        //
        
        mapView.delegate = self
        addCustomAnnotation()
    }


}

