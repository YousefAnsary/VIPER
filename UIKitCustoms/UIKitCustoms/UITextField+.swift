//
//  UITextField+.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

@IBDesignable
class TextField: UITextField {
    
    private var placeholderColor: UIColor?
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeholderColor
        }
        set {
            self.placeholderColor = newValue
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    @IBInspectable var leftPadding: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var rightPadding: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    
}
