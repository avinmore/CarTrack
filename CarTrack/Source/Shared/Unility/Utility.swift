//
//  Utility.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import UIKit
class Utility {
    class func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        let action = UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(action)
    }
}
