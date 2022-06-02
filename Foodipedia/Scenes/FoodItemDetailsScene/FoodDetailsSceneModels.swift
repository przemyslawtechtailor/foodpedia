//
//  FoodDetailsSceneModels.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 02/06/2022.
//

import Foundation
import SwiftUIPager

class FoodDetailsSceneModels {
    struct Pages {
        struct Request {}

        struct Response {
            var item: FoodDetails.Item
        }

        struct ViewModel {
            var page: Page
            var items: [CardComponentData]
        }
    }

    enum CardColorType {
        case green
        case orange
        case purple
    }
    
    struct CardComponentData: Hashable {
        var title: String
        var subtitle: String

        var percentage: Float
        var progressBarDescription: String
        var colorType: CardColorType
    }
}
