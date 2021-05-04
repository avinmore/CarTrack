//
//  Extensions.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//

import UIKit
extension UITextField {
    func setCountryPickerView(_ callback:((String?) -> Void)?) {
        CountryListManager.shared.loadCountryData()
        inputView = CountryListManager.shared.fetchPickerView()
        inputAccessoryView = CountryListManager.shared.fetchToolbar()
        CountryListManager.shared.didSelectCountry = callback
    }
}
