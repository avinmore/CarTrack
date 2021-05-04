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
    @IBOutlet weak var userGeoLocation: MKMapView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadData()
    }
    func loadData() {
        userName.loadData("Dr Strange", textColor: .black, pointSize: 13, weight: .regular)
        userEmail.loadData("s@m.c", textColor: .black, pointSize: 13, weight: .regular)
        userPhone.loadData("+7001222", textColor: .black, pointSize: 13, weight: .regular)
        userWebsite.loadData("weasart.com", textColor: .black, pointSize: 13, weight: .regular)
        userCompany.loadData("WEwqwq", textColor: .black, pointSize: 13, weight: .regular)
        userAddress.loadData("qwqwqwqwqw qwqwqw qwqwq qwqwqw qwqwqw qwqwqwqwqwqwq", textColor: .black, pointSize: 13, weight: .regular)
    }
}
