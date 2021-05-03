//
//  CountryListManager.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//
import UIKit
class CountryListManager: NSObject {
    static let shared = CountryListManager() //just for demo, otherwise singleton is a anti-pattern
    private var countryData = [String]()
    var didSelectCountry:((String?) -> Void)?
    private var selectedCountry: String?
    private let pickerView = UIPickerView()
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
    func fetchToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }
    func fetchPickerView() -> UIPickerView {
        pickerView.delegate = CountryListManager.shared
        return pickerView
    }
    @objc func donePicker() {
        didSelectCountry?(selectedCountry)
        selectedCountry = nil
    }
    @objc func cancelPicker() {
        selectedCountry = nil
        didSelectCountry?(selectedCountry)
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
        selectedCountry = CountryListManager.shared.countryData[row]
    }
}
extension UITextField {
    func setCountryPickerView(_ callback:((String?) -> Void)?) {
        CountryListManager.shared.loadCountryData()
        inputView = CountryListManager.shared.fetchPickerView()
        inputAccessoryView = CountryListManager.shared.fetchToolbar()
        CountryListManager.shared.didSelectCountry = callback
    }
}
