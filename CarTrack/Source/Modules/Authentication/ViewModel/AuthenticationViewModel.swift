//
//  AuthenticationViewModel.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//
import Foundation
enum TextFiledType: Int {
    case userName
    case password
    case selection
}
/// Authentication view's  viewMode, responsible for handling all data, auth logic and validations.
class AuthenticationViewModel {
    /// This returns the country names
    var countryList: [String] {
        let countryList = Locale.isoRegionCodes.compactMap {
            Locale.current.localizedString(forRegionCode: $0)
        }
        return countryList
    }
    var userName: String? {
        didSet {
            let status = validateInput(textfiledType: .userName)
            updateLoginButtonStatus?(status)
        }
    }
    var password: String? {
        didSet {
            let status = validateInput(textfiledType: .password)
            updateLoginButtonStatus?(status)
        }
    }
    var selectedCountry: String? {
        didSet {
            let status = validateInput(textfiledType: .selection)
            updateLoginButtonStatus?(status)
        }
    }
    var updateLoginButtonStatus: (([(isValid: Bool, type: TextFiledType)]) -> Void)?
    var loginButtonStatus = [(isValid: Bool, type: TextFiledType)]()
    func validateInput(textfiledType: TextFiledType) -> [(Bool, TextFiledType)] {
        switch textfiledType {
        case .userName:
            let isValid = userName?.isValidUserName() ?? false
            loginButtonStatus = loginButtonStatus.filter({ $0.type != .userName})
            loginButtonStatus.append((isValid: isValid, type: .userName))
        case .password:
            loginButtonStatus = loginButtonStatus.filter({ $0.type != .password})
            if let pass = self.password, pass.count > 5 {
                loginButtonStatus.append((isValid: true, type: .password))
            } else {
                loginButtonStatus.append((isValid: false, type: .password))
            }
        case .selection:
            if let country = self.selectedCountry, !country.isEmpty {
                loginButtonStatus.append((isValid: true, type: .selection))
            } else {
                loginButtonStatus.append((isValid: false, type: .selection))
            }
        }
        return loginButtonStatus
    }
}
extension String {
    func isValidUserName() -> Bool {
            let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}",
                                                 options: .caseInsensitive)
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
}
