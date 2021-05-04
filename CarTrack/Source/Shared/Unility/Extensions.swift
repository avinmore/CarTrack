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
extension UIView {
    func transformViewAnimation() {
        let originalTransform = transform
        let scaledTransform = originalTransform.scaledBy(x: 0.2, y: 0.2)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: 0.0, y: -250.0)
        transform = scaledAndTranslatedTransform
        UIView.animate(withDuration: 1, animations: {
            self.transform = originalTransform
        })
    }
}
