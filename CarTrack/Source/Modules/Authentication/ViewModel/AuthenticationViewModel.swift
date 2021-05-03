//
//  AuthenticationViewModel.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//
import Foundation
/// Authentication view's  viewMode, responsible for handling all data, auth logic and validations.
class AuthenticationViewModel {
    /// This returns the country names
    var countryList: [String] {
        let countryList = Locale.isoRegionCodes.compactMap {
            Locale.current.localizedString(forRegionCode: $0)
        }
        return countryList
    }
}
