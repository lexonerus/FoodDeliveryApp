//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Alexey Krzywicki on 24.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    
    }

    func facebookPress() {
        print("facebook")
    }
    func googlePress() {
        print("google")
    }
    

}

private extension LoginViewController {
    func setupLayout() {
        setupBottomView()
    }
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.button2Action = facebookPress
        bottomView.button1Action = googlePress
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
}


#Preview("LoginVC") {
    LoginViewController()
}
