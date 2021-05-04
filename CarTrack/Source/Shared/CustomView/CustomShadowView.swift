//
//  CustomShadowView.swift
//  CarTrack
//
//  Created by Avin More on 3/5/21.
//
import UIKit
@IBDesignable
class CustomShadowView: UIView {
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }

    @IBInspectable var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    @IBInspectable var cornerRadious: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadious
        }
    }
    @IBInspectable var cropTop: CGFloat = 0 {
        didSet {
            if cropTop > 0 {
                layer.cornerRadius = cropTop
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        }
        
    }
}
