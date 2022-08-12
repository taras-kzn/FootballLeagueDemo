//
//  UIImageView+Extension.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 09.08.2022.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()

        self.image = image
        self.contentMode = contentMode
    }
}
