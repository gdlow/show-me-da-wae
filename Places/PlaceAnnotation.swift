//
//  PlaceAnnotation.swift
//  Places
//
//  Created by Gerald Low on 20/10/2018.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation
import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
  let coordinate: CLLocationCoordinate2D
  let title: String?
  
  init(location: CLLocationCoordinate2D, title: String) {
    self.coordinate = location
    self.title = title
    
    super.init()
  }
}
