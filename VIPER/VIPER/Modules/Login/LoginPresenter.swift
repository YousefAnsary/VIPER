//
//  LoginPresenter.swift
//  VIPER
//
//  Created by Yousef on 1/7/21.
//

import Foundation

protocol LoginDelegate: Presenter {
    func loginSuccess(data: UserData)
}

class LoginPresenter {
    
    private weak var delegate: LoginDelegate?
    private var interactor: LoginInteractor
    private var router: LoginRouter
    
    init(delegate: LoginDelegate, interactor: LoginInteractor, router: LoginRouter) {
        self.delegate = delegate
        self.interactor = interactor
        self.router = router
    }
    
    func loginTapped(email: String, password: String) {
        
        guard validateInputs(email: email, password: password) else {return}
        delegate?.showLoader()
        
        interactor.login(email: email, password: password) { [weak self] res in
            guard let self = self else {return}
            self.delegate?.dismissLoader()
            
            switch res {
            case.success(let data):
                self.delegate?.loginSuccess(data: data)
            case .failure(let err):
                self.delegate?.showAlert(withTitle: "Unexpected Error", msg: err.localizedDescription)
            }
            
        }
        
    }
    
    func loginSuccess() {
        guard let vc = delegate as? LoginViewController else { return }
        router.navigateToHome(from: vc)
    }
    
    private func validateInputs(email: String, password: String)-> Bool {
        
        guard email.isValidEmail else {
            delegate?.showAlert(withTitle: nil, msg: "Invalid E-Mail")
            return false
        }
        
        guard password.count > 5 else {
            delegate?.showAlert(withTitle: nil, msg: "Password must consist of 6 digits at least")
            return false
        }
        
        return true
        
    }
    
}
