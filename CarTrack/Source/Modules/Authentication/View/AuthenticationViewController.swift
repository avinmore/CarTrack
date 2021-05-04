//
//  AuthenticationViewController.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//

import UIKit
class AuthenticationViewController: UIViewController {
    let viewModel = AuthenticationViewModel()
    @IBOutlet weak var loginActionButton: BaseButton!
    @IBOutlet weak var countryPickerTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userNameErrorText: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI() {
        loginActionButton.loadData("Login", buttonType: .submit, isDisabled: true, cornerRadius: 8)
        countryPickerTextField.setCountryPickerView { [weak self] selectedCountry in
            guard let country = selectedCountry else {
                self?.view.endEditing(true)
                return
            }
            self?.countryPickerTextField.text = country
            self?.viewModel.selectedCountry = country
            self?.view.endEditing(true)
        }
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        userNameTextField.tag = TextFiledType.userName.rawValue
        passwordTextField.tag = TextFiledType.password.rawValue
        viewModel.updateLoginButtonStatus = { [weak self] results in
            self?.userNameErrorText.isHidden = true
            self?.passwordErrorText.isHidden = true
            self?.loginActionButton.loadStatus(isDisabled: false)
            if !results.isEmpty {
                DispatchQueue.main.async {
                    results.forEach { result in
                        switch result.type {
                        case TextFiledType.userName:
                            self?.userNameErrorText.isHidden = result.isValid
                        case TextFiledType.password:
                            self?.passwordErrorText.isHidden = result.isValid
                        case TextFiledType.selection: break
                        }
                        if !result.isValid || results.count != 3 {
                            self?.loginActionButton.loadStatus(isDisabled: true)
                        }
                    }
                }
            }
        }
    }
    @IBAction func loginButtonTapped(_ sender: BaseButton) {
        guard let dashboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthenticationViewController") as? AuthenticationViewController else {
            return
        }        
    }
    
}
extension AuthenticationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText = ""
        if string.isEmpty {
            newText = String(textField.text?.dropLast() ?? "")
        } else {
            guard let stringRange = Range(range, in: textField.text ?? "") else { return false }
            newText = textField.text?.replacingCharacters(in: stringRange, with: string) ?? ""
        }
        
        switch TextFiledType(rawValue: textField.tag) {
        case .userName:
            viewModel.userName = newText
        case .password:
            viewModel.password = newText
        default: break
        }
        return true
    }
}
