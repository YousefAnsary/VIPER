//
//  UINavigationBar+.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

extension UINavigationBar {
    
    func addShadow(withColor color: CGColor = UIColor.lightGray.cgColor,
                   opacity: Float = 0.4,
                   offset: CGSize = CGSize(width: 0, height: 2.0),
                   radius: CGFloat = 2) {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
    
    func removeShadow() {
        self.layer.shadowOpacity = 0
    }
    
}
