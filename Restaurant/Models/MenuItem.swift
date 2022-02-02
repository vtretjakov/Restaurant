//
//  MenuItem.swift
//  Restaurant
//
//  Created by Владимир on 25.01.2022.
//

import Foundation
import UIKit

class MenuItem: Codable {
    let id: Int
    let name: String
    let detailText: String // detailText = discription
    let price: Double
    let category: String
    let imageURL: URL // автоматическое преобразование из String в URL
    var image: UIImage?
    
    // struct имеет дефолтный инициализатор (в классе мы добавляем)
    
    init(
    id: Int,
    name: String,
    detailText: String,
    price: Double,
    category: String,
    imageURL: URL,
    image: UIImage? = nil
    ) {
        self.id = id
        self.name = name
        self.detailText = detailText
        self.price = price
        self.category = category
        self.imageURL = imageURL
        self.image = image
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}


