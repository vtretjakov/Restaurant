//
//  AppDelegate.swift
//  Restaurant
//
//  Created by Владимир on 23.01.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var orderTabBarItem: UITabBarItem!
    
    @objc func updateOrderBadge() {
        let count = OrderManager.shared.order.menuItems.count
        orderTabBarItem.badgeValue = 0 < count ? "\(count)" : nil
    }
    
  //  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
  //  let temporaryDirectory = NSTemporaryDirectory()
  //  let urlCashe = URLCache(
  //      memoryCapacity: 25_000_000,
  //     diskCapacity: 50_000_000,
  //     diskPath: temporaryDirectory)
  //     URLCache.shared = urlCashe
        
    //    let tabBarController = window!.rootViewController as! UITabBarController     // инициализатор при первой загрузке (rootVC - первый контроллер)
     //   orderTabBarItem = tabBarController.viewControllers![1].tabBarItem     // 0 - навигейшн который относится к меню, добавление количества заказов к order
        
    //    NotificationCenter.default.addObserver(
    //       self,
    //        selector: #selector(updateOrderBadge),
    //        name: OrderManager.orderUpdatedNotification,
    //       object: nil
    //   )
     //   return true
    // } // - не отрабатывает(неожиданный nil)
    
}

