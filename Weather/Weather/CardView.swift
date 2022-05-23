//
//  CardView.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation
import UIKit
class CardView: UIView{
    @IBInspectable var cornerRadius: CGFloat = 15

    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.lightGray
    @IBInspectable var shadowOpacity: Float = 0.3

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
}
