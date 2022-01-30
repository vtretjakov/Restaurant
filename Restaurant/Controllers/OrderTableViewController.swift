//
//  OrderTableViewController.swift
//  Restaurant
//
//  Created by Владимир on 30.01.2022.
//

import UIKit

class OrderTableViewController: UITableViewController {

    // MARK: - Constants
    
    let cellManager = CellManager()
    
    // MARK: - Stored Properties
    
    var order = OrderManager.shared.order
    
    // MARK: - UITableViewSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.menuItems.count // количество элементов в заказе
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
        
        let menuItem = order.menuItems[indexPath.row]
        cellManager.configure(cell, with: menuItem, for: tableView, indexPath: indexPath)
        return cell
    }
    
}
