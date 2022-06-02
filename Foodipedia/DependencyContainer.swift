//
//  DependencyContainer.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 02/06/2022.
//

import Foundation

class DependencyContainer {
    static let instance = DependencyContainer()

    lazy var router: Router = {
        Router()
    }()

    lazy var foodDetailsClient: FoodDetailsClientProtocol = {
        FoodDetailsClient()
    }()

    lazy var fakeFoodDetailsClient: FoodDetailsClientProtocol = {
        FakeDetailsClient()
    }()

    lazy var foodDetailsUseCase: FoodDetailsUseCase = {
        FoodDetailsUseCase(client: fakeFoodDetailsClient)
//       FoodDetailsUseCase(client: foodDetailsClient)
    }()
}
