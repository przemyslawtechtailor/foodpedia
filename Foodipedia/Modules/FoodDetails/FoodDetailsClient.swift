//
//  FoodDetailsClient.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 28/05/2022.
//

import Combine
import Foundation

protocol FoodDetailsClientProtocol {
    func getFoodData(forId id: Int) -> AnyPublisher<FoodDetails.Item, Error>
}

class FoodDetailsClient: FoodDetailsClientProtocol {
    func getFoodData(forId id: Int) -> AnyPublisher<FoodDetails.Item, Error> {
        let url = URL(string: " https://api.lifesum.com/v2/foodipedia/codetest?foodid=\(id)")!
        var urlRequest = URLRequest(url: url, timeoutInterval: 60)
        urlRequest.setValue("23863708:465c0554fd00da006338c72e282e939fe6576a25fd00c776c0fbe898c47c9876", forHTTPHeaderField: "Authorization")

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: DefaultResponseBody<FoodDetails.Item>.self, decoder: JSONDecoder())
            .map(\.response)
            .eraseToAnyPublisher()
    }
}

class FakeDetailsClient: FoodDetailsClientProtocol {
    func getFoodData(forId id: Int) -> AnyPublisher<FoodDetails.Item, Error> {
        let subject = PassthroughSubject<FoodDetails.Item, Error>()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            subject.send(FoodDetails.Item.fakeItem())
            subject.send(completion: .finished)
//            subject.send(completion: .failure(NSError(domain: "some", code: 1)))
        }
        return subject.eraseToAnyPublisher()
    }
}
