//
//  CustomAnnotation.swift
//  demoMapApp2
//
//  Created by IZIY on 8/24/23.
//

import Foundation
import MapKit

class CustomAnnotation : NSObject,MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coor:CLLocationCoordinate2D){
        coordinate = coor
    }
}
