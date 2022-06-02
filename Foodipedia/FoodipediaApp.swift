//
//  FoodipediaApp.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 26/05/2022.
//

import SwiftUI

@main
struct FoodipediaApp: App {
    var body: some Scene {
        WindowGroup {
            FoodItemsScene(interactor: FoodItemSceneInteractor())
        }
    }
}
