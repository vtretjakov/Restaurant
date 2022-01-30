//
//  OrderManager.swift
//  Restaurant
//
//  Created by Владимир on 30.01.2022.
//

import Foundation

class OrderManager {
    
    static var shared = OrderManager()
    
    private init() {}
    
    var order = Order()
}
