//
//  ItemTableViewController.swift
//  Restaurant
//
//  Created by Владимир on 26.01.2022.
//

import UIKit

class ItemTableViewController: UITableViewController {

// MARK: - Properties
    
    let networkManager = NetworkManager()
    var category: String!
    var menuItems = [MenuItem]()
    
// MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = category.localizedCapitalized
        
        networkManager.getMenuItems(for: category) {
            menuItems, error in
            guard let menuItems = menuItems else {
                print(#line, #function, "ERROR: ", terminator: "")
                if let error = error {
                    print(error)
                } else {
                    print("Can't get menu items for category \(self.category ?? "nil")")
                }
                return
            }
            self.menuItems = menuItems
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
        }
    }
    // MARK: - UITAbleViewControllerDelegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        
        // TODO: configure cell
        
        return cell
    }
}


