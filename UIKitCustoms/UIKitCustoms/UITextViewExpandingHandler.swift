//
//  UITextViewExpandingHandler.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

class UITextViewExpandingHandler: NSObject, UITextViewDelegate {
    
    weak var textView: UITextView? {
        didSet {
            textView?.delegate = self
            textView?.text = placeholder
            textView?.textColor = placeholderColor
        }
    }
    private weak var height: NSLayoutConstraint?
    private var placeholder: String
    private var placeholderColor: UIColor
    private var textColor: UIColor
    
    init(textView: UITextView, heightContraint: NSLayoutConstraint?, placeholder: String,
         placeholderColor: UIColor, textColor: UIColor) {
        self.height = heightContraint
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self.textColor = textColor
        self.textView = textView
//        self.textView?.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholder {
            textView.text = ""
            textView.textColor = textColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
            textView.textColor = placeholderColor
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize.init(width: fixedWidth, height: CGFloat(MAXFLOAT)))
        var newFrame = textView.frame
        newFrame.size = CGSize.init(width: CGFloat(fmaxf(Float(newSize.width), Float(fixedWidth))),
                                    height: newSize.height)
        self.height?.constant = newSize.height
    }
    
}
