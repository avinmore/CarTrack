//
//  TextfiledDisabledAction.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//
import UIKit
class TextfiledDisabledAction: UITextField {
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false       
    }
}
