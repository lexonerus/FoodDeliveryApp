//
//  HomeViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Alex Krzywicki on 20.10.2024.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var categoryData: [FoodCategory] { get }
//    var foodMenuData: [FoodMenuItem] { get }
//    var restaurantData: [Restaurant] { get }
    func getSelectedCategory() -> FoodCategory
}

class HomePresenter: HomePresenterProtocol {

    // MARK: - Properties
    let coordinator: HomeCoordinator
    var categoryData = [FoodCategory]()

    // MARK: - Initializers
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        getCategoryData()
    }

    // MARK: - Methods
    func getSelectedCategory() -> FoodCategory {
        return .none
    }

    private func getCategoryData() {
        // Mock data
        categoryData = [.drink, .food, .cake, .snack, .salad, .seafood]
    }
}
