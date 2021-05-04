//
//  CTAnnotation.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import UIKit
import MapKit
final class CTAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String? = nil
    var subtitle: String?
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
}
