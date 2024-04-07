//
//  LoginViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Alexey Krzywicki on 08.03.2024.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart(login: String, password: String)
    func registrationStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}

class LoginPresenter {
    
    private var coordinator: LoginCoordinator?
    weak var viewInput: LoginViewInput?
    
    init(coordinator: LoginCoordinator? = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
    
}

private extension LoginPresenter {
    func goToMainScene() {
        coordinator?.finish()
    }
}

extension LoginPresenter: LoginViewOutput {
    func loginStart(login: String, password: String) {
        viewInput?.startLoader()
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            if login.lowercased() == "test@mail.com" && password == "Test123" {
                DispatchQueue.main.async { [weak self] in
                    self?.viewInput?.stopLoader()
                    self?.goToMainScene()
                }
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.viewInput?.stopLoader()
                    print("Wrong login or password")
                }
            }
        }
    }
    
    func registrationStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgotPass() {
        
    }
    
    func back() {
        
    }
    
    
}
