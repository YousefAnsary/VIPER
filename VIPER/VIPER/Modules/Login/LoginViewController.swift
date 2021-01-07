//
//  LoginViewController.swift
//  VIPER
//
//  Created by Yousef on 1/7/21.
//

import UIKit

class LoginViewController: ViewController {
    
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var loginBtn: UIButton!
    @IBOutlet private weak var registerBtn: UIButton!
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction private func loginBtnDidTapped(_ button: UIButton) {
        presenter?.loginTapped(email: emailTF.text!, password: passwordTF.text!)
    }
    
    @IBAction private func registerBtnDidTapped(_ button: UIButton) {
        
    }
    
}

extension LoginViewController: LoginDelegate {
    
    func loginSuccess(data: UserData) {
        displayAlert(withMsg: "Hello \(data.name ?? "")", title: "Login Success") {
            self.presenter?.loginSuccess()
        }
    }
    
}
