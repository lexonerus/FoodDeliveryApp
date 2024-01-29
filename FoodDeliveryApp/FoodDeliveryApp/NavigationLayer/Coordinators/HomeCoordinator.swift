//
//  HomeCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Alexey Krzywicki on 29.01.2024.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}
