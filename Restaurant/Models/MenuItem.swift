//
//  MenuItem.swift
//  Restaurant
//
//  Created by Владимир on 25.01.2022.
//

import Foundation
import UIKit

struct MenuItem: Codable {
    let id: Int
    let name: String
    let detailText: String // detailText = discription
    let price: Double
    let category: String
    let imageURL: URL // автоматическое преобразование из String в URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}
