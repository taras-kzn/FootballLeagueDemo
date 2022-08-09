//
//  StackView+Extension.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 09.08.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)

        self.axis = axis
        self.spacing = spacing
    }
}
