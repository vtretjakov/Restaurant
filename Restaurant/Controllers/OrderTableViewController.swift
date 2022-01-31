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
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            tableView!,
            selector: #selector(UITableView.reloadData),
            name: OrderManager.orderUpdatedNotification,
            object: nil) // всегда когда приходит уведомление будет обновляться таблица
    }
    
    // MARK: - UITableViewSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderManager.shared.order.menuItems.count // количество элементов в заказе
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
        let menuItem = OrderManager.shared.order.menuItems[indexPath.row]
        cellManager.configure(cell, with: menuItem, for: tableView, indexPath: indexPath)
        return cell
    }
}
