//
//  DefaultResponse.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 02/06/2022.
//

import Foundation

struct DefaultResponseBody<T: Codable>: Codable {
    var response: T
}
