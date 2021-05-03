//
//  AuthenticationViewController.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//

import UIKit
class AuthenticationViewController: UIViewController {
    @IBOutlet weak var loginActionButton: BaseButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userNameErrorText: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginActionButton.loadData("Login", isDisabled: true, cornerRadius: 8)
    }


}
