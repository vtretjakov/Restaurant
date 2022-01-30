//
//  Order.swift
//  Restaurant
//
//  Created by Владимир on 30.01.2022.
//

import Foundation

struct Order {
    
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
    
}
