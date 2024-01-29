//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Alexey Krzywicki on 29.01.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}
