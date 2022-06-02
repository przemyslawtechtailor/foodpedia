//
//  FoodDetailsUseCase.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 28/05/2022.
//

import Combine
import Foundation

class FoodDetailsUseCase {
    
    
    private let client: FoodDetailsClientProtocol
    
    init(client: FoodDetailsClientProtocol) {
        self.client = client
    }
    
    func requestRandomFoodItem() -> AnyPublisher<FoodDetails.Item, Error> {
        let randomId = Int.random(in: 0...200)
        return client.getFoodData(forId: randomId)
    }
}
