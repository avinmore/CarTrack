//
//  BaseButton.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//
import UIKit
class BaseButton: UIButton {
    public var isDisabled: Bool {
        set {
            isUserInteractionEnabled = !newValue
            switch newValue {
            case false:
                backgroundColor = .enabledButtonBG
                setTitleColor(.enabledButtonTxt, for: .normal)
            case true:
                backgroundColor = .disabledButtonBG
                setTitleColor(.disabledButtonTxt, for: .normal)
            }
        }
        get {
            return isUserInteractionEnabled
        }
    }
    func loadData(_ text: String? = "", isDisabled: Bool = false,  cornerRadius: CGFloat = 0) {
        setTitleColor(.enabledButtonTxt, for: .normal)
        setTitle(text, for: .normal)
        layer.cornerRadius = cornerRadius
        self.isDisabled = isDisabled
    }
}
public func hexToColor(_ color: String) -> UIColor {
    UIColor(hex: Int(color, radix: 16) ?? Int("000000", radix: 16)!)!
}
extension UIColor {
    open class var disabledButtonBG: UIColor { hexToColor("C8C8C8") }
    open class var enabledButtonBG: UIColor { hexToColor("81673F") }
    open class var disabledButtonTxt: UIColor { hexToColor("282828") }
    open class var enabledButtonTxt: UIColor { hexToColor("FFFFFF") }
    
    @objc convenience init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }

        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
    @objc convenience init?(hex: Int, transparency: CGFloat = 1) {
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        self.init(red: red, green: green, blue: blue, transparency: trans)
    }
}
