//
//  CustomAnnotation.swift
//  demoMapApp3
//
//  Created by IZIY on 8/24/23.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject,MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    override init(coor: CLLocationCoordinate2D) {
        coordinate = coor
    }
}
