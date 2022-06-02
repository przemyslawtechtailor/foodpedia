//
//  FoodItemDetailsScenePresenter.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 02/06/2022.
//

import Foundation

protocol FoodItemDetailsScenePresenterProtocol {
    func presentPages(response: FoodDetailsSceneModels.Pages.Response)
}

class FoodItemDetailsScenePresenter: ObservableObject, FoodItemDetailsScenePresenterProtocol {
    @Published var requestData: FoodDetailsSceneModels.Pages.ViewModel?

    func presentPages(response: FoodDetailsSceneModels.Pages.Response) {
        // TODO: not sure about meaing behind model that comes from API, fill some cards with data based on assumptions
        let item = response.item
        let fat = FoodDetailsSceneModels.CardComponentData(
            title: "Fat",
            subtitle: "\(Int(item.gramsperserving * item.gramsperserving))gram / serving",
            percentage: item.fat / 100,
            progressBarDescription: "\(Int(item.fat))% of daily recommended",
            colorType: .orange
        )
        let protein = FoodDetailsSceneModels.CardComponentData(
            title: "Protein",
            subtitle: "",
            percentage: item.protein / 100,
            progressBarDescription: "\(Int(item.protein))% of daily recommended",
            colorType: .green
        )
        let carbs = FoodDetailsSceneModels.CardComponentData(
            title: "Carbs",
            subtitle: "",
            percentage: item.carbs / 100,
            progressBarDescription: "\(Int(item.carbs))% of daily recommended",
            colorType: .purple
        )
        
        requestData = FoodDetailsSceneModels.Pages.ViewModel(page: .withIndex(1), items: [fat, protein, carbs])
    }
}
