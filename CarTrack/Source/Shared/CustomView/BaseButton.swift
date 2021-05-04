//
//  BaseButton.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//
import UIKit
class BaseButton: UIButton {
    enum ButtonType {
        case submit
        case selection
        case none
    }
    public var buttonActionType: ButtonType = .none
    public var isDisabled: Bool {
        set {
            isUserInteractionEnabled = !newValue
            switch newValue {
            case false:
                switch buttonActionType {
                case .submit:
                    backgroundColor = .enabledButtonBG
                    setTitleColor(.enabledButtonTxt, for: .normal)
                case .selection:
                    backgroundColor = .selectionEnabledButtonBG
                    setTitleColor(.selectionEnabledButtonTxt, for: .normal)
                    layer.borderWidth = 1.0
                    layer.borderColor = UIColor.selectionDisabledButtonTxt.cgColor
                case .none: break
                }
                
            case true:
                switch buttonActionType {
                case .submit:
                    backgroundColor = .disabledButtonBG
                    setTitleColor(.disabledButtonTxt, for: .normal)
                case .selection:
                    backgroundColor = .selectionDisabledButtonBG
                    setTitleColor(.selectionDisabledButtonTxt, for: .normal)
                    layer.borderWidth = 1.0
                    layer.borderColor = UIColor.selectionDisabledButtonTxt.cgColor
                case .none: break
                }
                
            }
        }
        get {
            return isUserInteractionEnabled
        }
    }
    func loadData(_ text: String? = "", buttonType: ButtonType = .none, isDisabled: Bool = false,  cornerRadius: CGFloat = 0) {
        setTitleColor(.enabledButtonTxt, for: .normal)
        setTitle(text, for: .normal)
        layer.cornerRadius = cornerRadius
        buttonActionType = buttonType
        self.isDisabled = isDisabled
    }
    public func loadStatus(isDisabled: Bool = false) {
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
    
    open class var selectionEnabledButtonTxt: UIColor { hexToColor("A37C3C") }
    open class var selectionEnabledButtonBG: UIColor { .clear }
    open class var selectionDisabledButtonTxt: UIColor { hexToColor("AD9C7F") }
    open class var selectionDisabledButtonBG: UIColor { hexToColor("DEDEDE") }
    
    
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
