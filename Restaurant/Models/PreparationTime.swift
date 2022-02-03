//
//  PreparationTime.swift
//  Restaurant
//
//  Created by Владимир on 03.02.2022.
//

import Foundation

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    } // возращает словарь где в качестве ключа будет PreparationTime а в качестве значения будет целое число
}
