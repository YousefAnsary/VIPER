//
//  UIViewController.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

public extension UIViewController {
    
    func displayAlert(withMsg msg: String, title: String? = nil, btnHandler: (()-> ())? = nil) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { ـ in
            btnHandler?()
        }))
        present(alert, animated: true)
    }
    
    func displayAlert(withStyle style: UIAlertController.Style,
                      msg: String, title: String? = nil,
                      actions: UIAlertAction...) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: style)
        actions.forEach{ alert.addAction($0) }
        present(alert, animated: true)
    }
    
    func displayError(_ error: LocalizedError, title: String = "Unexpected Error") {
        displayAlert(withMsg: error.localizedDescription, title: title)
    }
    
    func removeBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}
