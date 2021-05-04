//
//  Lable.swift
//  CarTrack
//
//  Created by Avin More on 4/5/21.
//
import UIKit
class Label: UILabel {
    func loadData(_ text: String?, textColor: UIColor = UIColor.black, pointSize: CGFloat = 12, weight: UIFont.Weight = .regular) {
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: pointSize, weight: weight)
        self.text = text
        self.textColor = textColor
    }
}
