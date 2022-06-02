//
//  FoodItemDetailsSceneInteractor.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 02/06/2022.
//

import Foundation


protocol FoodItemDetailsSceneInteractorProtocol {
    func loadData(request: FoodDetailsSceneModels.Pages.Request)
}

class FoodItemDetailsSceneInteractor: FoodItemDetailsSceneInteractorProtocol {
    var foodItem: FoodDetails.Item

    var presenter: FoodItemDetailsScenePresenterProtocol!

    init(foodItem: FoodDetails.Item, container: DependencyContainer = .instance) {
        self.foodItem = foodItem
    }

    func loadData(request: FoodDetailsSceneModels.Pages.Request) {
        presenter.presentPages(response: FoodDetailsSceneModels.Pages.Response(item: foodItem))
    }
}
