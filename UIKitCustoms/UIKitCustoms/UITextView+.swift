//
//  UITextView+.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

///UITextView Subclass to get Designables work in interface builder
@IBDesignable
class TextView: UITextView {}

@IBDesignable
extension UITextView {
    
    @IBInspectable
    public var topPadding: CGFloat {
        get {
            return textContainerInset.top
        } set {
            textContainerInset.top = newValue
        }
    }
    
    @IBInspectable
    public var bottomPadding: CGFloat {
        get {
            return textContainerInset.bottom
        } set {
            textContainerInset.bottom = newValue
        }
    }
    
    @IBInspectable
    public var rightPadding: CGFloat {
        get {
            return textContainerInset.right
        } set {
            textContainerInset.right = newValue
        }
    }
    
    @IBInspectable
    public var leftPadding: CGFloat {
        get {
            return textContainerInset.left
        } set {
            textContainerInset.left = newValue
        }
    }
    
}
