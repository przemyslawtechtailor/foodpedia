//
//  FoodDetailsModels.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 28/05/2022.
//

import Foundation

enum FoodDetails {
    struct Item {
        var carbs: Float
        var fiber: Float
        var title: String
        var pcstext: String
        var potassium: Float
        var sodium: Float
        var calories: Float
        var fat: Float
        var sugar: Float
        var gramsperserving: Float
        var cholesterol: Float
        var protein: Float
        var unsaturatedfat: Float
        var saturatedfat: Float
    }
}

extension FoodDetails.Item: Codable {
}

extension FoodDetails.Item {
    static func fakeItem() -> FoodDetails.Item {
        return FoodDetails.Item(
            carbs: 10,
            fiber: 0,
            title: "CASHEWS",
            pcstext: "",
            potassium: 0.105,
            sodium: 0.084,
            calories: 400,
            fat: 30,
            sugar: 0.27,
            gramsperserving: 200.0,
            cholesterol: 0.051,
            protein: 60,
            unsaturatedfat: 4.012,
            saturatedfat: 8.295
        )
    }
}
