//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Владимир on 24.01.2022.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getCategories {
            categories, error in
            if let categories = categories {
                print(#line, #function, categories)
            } else {
                if let error = error {
                    print(#line, #function, "ERROR:", error.localizedDescription)
                } else {
                    print(#line, #function, "ERROR: Can't load categories")
                }
            }
        }
    }
    
}
