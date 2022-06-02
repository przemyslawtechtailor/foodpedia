//
//  Router.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 02/06/2022.
//

import Foundation

class Router: ObservableObject {
    @Published var isDetailsPageActive = false
    
    
    func createFoodItemDetails(foodItem: FoodDetails.Item) -> FoodItemDetailsScene {
        let interactor = FoodItemDetailsSceneInteractor(foodItem: foodItem)
        let presenter = FoodItemDetailsScenePresenter()
        interactor.presenter = presenter
        return FoodItemDetailsScene(presenter: presenter, interactor: interactor)
    }
}
