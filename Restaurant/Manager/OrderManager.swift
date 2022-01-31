//
//  OrderManager.swift
//  Restaurant
//
//  Created by Владимир on 30.01.2022.
//

import Foundation

class OrderManager {
    
    static let orderUpdatedNotification = Notification.Name("OrderManager.orderUpdated")
    
    static var shared = OrderManager()
    
    private init() {}
    
    var order = Order() {
        didSet {
            NotificationCenter.default.post(name: OrderManager.orderUpdatedNotification, object: nil)
        } // при изменении Order будет посылаться notification (уведомление) что заказ изменился
    }
}
