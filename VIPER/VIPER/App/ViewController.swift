//
//  ViewController.swift
//  VIPER
//
//  Created by Yousef on 1/7/21.
//


import UIKit
import UIKitCustoms
import JGProgressHUD

class ViewController: UIViewController {
    
    let hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hud.textLabel.text = "Loading..."
        
    }
    
    func restartApp() {
        guard let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate else {return}
//        sceneDelegate.coordinator?.start()
    }
    
    func showLoadingHUD() {
        hud.show(in: self.view)
    }

    func hideHUDLoader() {
        hud.dismiss()
    }
    
    func displaySuccessHUD(dismissingIn time: Double = 0.6, completion: (()-> Void)? = nil) {
        DispatchQueue.main.async {
            let hud = JGProgressHUD(style: .dark)
            hud.textLabel.text = "Success"
            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
            hud.show(in: self.view, animated: true)
            hud.dismiss(afterDelay: time, animated: true)
            guard completion != nil else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: completion!)
        }
    }
    
    func displayErrorHUD(dismissingIn time: Double = 0.6, completion: (()-> Void)? = nil) {
        DispatchQueue.main.async {
            let hud = JGProgressHUD(style: .dark)
            hud.textLabel.text = "Error!"
            hud.indicatorView = JGProgressHUDErrorIndicatorView()
            hud.show(in: self.view, animated: true)
            hud.dismiss(afterDelay: time, animated: true)
            guard completion != nil else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: completion!)
        }
    }
    
}

