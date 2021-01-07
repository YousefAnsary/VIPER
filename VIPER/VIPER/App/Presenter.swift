//
//  Presenter.swift
//  VIPER
//
//  Created by Yousef on 1/7/21.
//

import UIKit
import UIKitCustoms

protocol Presenter: class {
    
    func showAlert(withTitle title: String?, msg: String)
    func showLoader()
    func dismissLoader()
    
}

extension Presenter where Self: ViewController {
    
    func showAlert(withTitle title: String?, msg: String) {
        self.displayAlert(withMsg: msg, title: title, btnHandler: nil)
    }
    
    func showLoader() {
        self.showLoadingHUD()
    }
    
    func dismissLoader() {
        self.hideHUDLoader()
    }
    
}
