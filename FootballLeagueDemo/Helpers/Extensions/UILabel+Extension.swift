//
//  UILabel+Extension.swift
//  FootballLeagueDemo
//
//  Created by Denis on 09.08.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont? = .semiBold20(),textColor: UIColor) {
        self.init()

        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
