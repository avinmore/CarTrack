//
//  CountryListManager.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//

import Foundation
import UIKit
class CountryListManager: NSObject {
    static let shared = CountryListManager() //just for demo, other wise singleton is a anti-pattern
    private var countryData = [String]()
    var didSelectCountry:((String) -> Void)?
    func loadCountryData() {
        /// This returns the country names
        var countryList: [String] {
            let countryList = Locale.isoRegionCodes.compactMap {
                Locale.current.localizedString(forRegionCode: $0)
            }
            return countryList
        }
        CountryListManager.shared.countryData = countryList
    }
    func setInputPickerView(_ callback:((String) -> Void)?) {
        CountryListManager.shared.loadCountryData()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        CountryListManager.shared.didSelectCountry = callback
    }
}
extension CountryListManager:  UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CountryListManager.shared.countryData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CountryListManager.shared.countryData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        didSelectCountry?(CountryListManager.shared.countryData[row])
    }
}
