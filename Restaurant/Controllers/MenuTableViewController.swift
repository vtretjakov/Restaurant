//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Владимир on 24.01.2022.
//

import UIKit

class MenuTableViewController: UITableViewController {

    // MARK: - Properties
    
    let cellManager = CellManager()
    let networkManager = NetworkManager()
    var categories = [String]()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getCategories {
            categories, error in
            
            guard let categories = categories else {
                    if let error = error {
                        print(#line, #function, "ERROR:", error.localizedDescription)
                    } else {
                        print(#line, #function, "ERROR: Can't load categories")
                    } // Http ошибка в info.plist add app transport security
                return
            }
            
            self.categories = categories
            DispatchQueue.main.async {
                self.tableView.reloadData() // для обновления таблички, d.m.a - выполняется когда наша система может это сделать
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count // возращает кол-во элементов
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) // создает ячейку, указывать identify в tableViewCell
        cellManager.configure(cell, with: categories[indexPath.row]) // конфиг
        return cell
    }
    
}
