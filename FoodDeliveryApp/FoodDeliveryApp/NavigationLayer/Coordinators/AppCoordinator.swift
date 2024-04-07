//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Alexey Krzywicki on 29.01.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        if userStorage.passedOnboarding {
            showAuthFlow()
        } else {
            showOnboardingFlow()
        }
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        onboardingCoordinator.start()
    }
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    func showAuthFlow() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = factory.makeLoginFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        loginCoordinator.start()
    }
}

// MARK: - FinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinatro: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinatro)
        
        switch childCoordinatro.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showAuthFlow()
        case .login:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
