//
//  UserInfoTableViewCell.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import UIKit
import MapKit
class UserInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: Label!
    @IBOutlet weak var userEmail: Label!
    @IBOutlet weak var userPhone: Label!
    @IBOutlet weak var userWebsite: Label!
    @IBOutlet weak var userCompany: Label!
    @IBOutlet weak var userAddress: Label!
    @IBOutlet weak var userGeoLocation: MKMapView! {
        didSet {
            userGeoLocation.register(MKMarkerAnnotationView.self,
                                     forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func loadData(_ user: CTUser) {
        let coord = CLLocationCoordinate2D(
            latitude: Double(user.address.geo.lat) ?? 0,
            longitude: Double(user.address.geo.lng) ?? 0)
        let location = CTAnnotation(coordinate: coord, title: user.name, subtitle: user.address.description())
        userGeoLocation.addAnnotation(location)
        userGeoLocation.showAnnotations([location], animated: false)
        userName.loadData(user.name, textColor: .white, pointSize: 17, weight: .bold)
        userEmail.loadData(user.email, textColor: .userDetailsTxtColot, pointSize: 15, weight: .regular)
        userPhone.loadData(user.phone, textColor: .userDetailsTxtColot, pointSize: 15, weight: .regular)
        userWebsite.loadData(user.website, textColor: .userDetailsTxtColot, pointSize: 15, weight: .regular)
        userCompany.loadData(user.company.description(), textColor: .userDetailsTxtColot, pointSize: 15, weight: .regular)
        userAddress.loadData(user.address.description(), textColor: .userDetailsTxtColot, pointSize: 15, weight: .regular)
    }
}
extension UserInfoTableViewCell {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotationView = userGeoLocation.dequeueReusableAnnotationView(
            withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            annotationView.animatesWhenAdded = true
            annotationView.titleVisibility = .adaptive
            annotationView.subtitleVisibility = .adaptive
            return annotationView
        }
        return nil
    }
}
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
