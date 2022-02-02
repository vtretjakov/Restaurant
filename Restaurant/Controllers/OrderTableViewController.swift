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
    let networkManager = NetworkManager()
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            tableView!,
            selector: #selector(UITableView.reloadData),
            name: OrderManager.orderUpdatedNotification,
            object: nil) // всегда когда приходит уведомление будет обновляться таблица
    }
    
    // MARK: - Stored Properties
    
    var minutes = 0
    
    // MARK: - Navigation
    
    // нужно получить кол-во минут с сервера и передать в OrderConfirmationViewController:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "OrderConfirmationSegue" else {return}
        let destination = segue.destination as! OrderConfirmationViewController
        destination.minutes = minutes
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        OrderManager.shared.order = Order()
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
    
    // MARK: - Custom Methods
    
    func uploadOrder() // фу-я должна: составить список идентификаторов которые нужно отправить на сервер menuUds;
    {
        
        let menuIds = OrderManager.shared.order.menuItems.map {$0.id}
        networkManager.submitOrder(forMenuIDs: menuIds) {
            minutes, error in
            if let error = error {
                print(#line, #function, "ERROR: \(error.localizedDescription)")
            } else {
                guard let minutes = minutes else {
                    print(#line,#function, "ERROR: didn't get minutes from server")
                    return
                }
                self.minutes = minutes
                DispatchQueue.main.async {
                self.performSegue(
                    withIdentifier: "OrderConfirmationSegue",
                    sender: nil)
          }
        }
      }
    }
    
    // MARK: - Action
    
    @IBAction func submitTapped(_ sender: UIBarButtonItem) {
        
        let orderTotal = OrderManager.shared.order.menuItems.reduce(0) {
            $0 + $1.price }
        
        let alert = UIAlertController(
            title: "Confirm Order",
            message: "You are about to submit your order with a total of \(orderTotal.formattedHundreds)",
            preferredStyle: .alert  // количество денег на которое пользователь хочет осуществить заказ (окно с выбором двух button при нажатии Submit)
        )
        alert.addAction(UIAlertAction(
            title: "Submit",
            style: .default)
                        { _ in
            self.uploadOrder()
        }) // при нажатии submit показываем uploadOrder
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel
            ))
        present(alert,
                animated: true
                )
        
    }
}


