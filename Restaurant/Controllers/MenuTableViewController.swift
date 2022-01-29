//
//  ItemTableViewController.swift
//  Restaurant
//
//  Created by Владимир on 26.01.2022.
//

import UIKit

class MenuTableViewController: UITableViewController {

// MARK: - Properties
    
    let cellManager = CellManager()
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
    // MARK: - UITableViewControllerDelegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let menuItem = menuItems[indexPath.row]
        cellManager.configure(cell, with: menuItem, for: tableView, indexPath: indexPath)
        return cell
    }
}


