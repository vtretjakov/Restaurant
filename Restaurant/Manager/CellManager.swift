//
//  CellManager.swift
//  Restaurant
//
//  Created by Владимир on 25.01.2022.
//

import UIKit

class CellManager {
    func configure (_ cell: UITableViewCell, with category: String) {
        cell.textLabel?.text = category.localizedCapitalized
    }
    
    func configure(
        _ cell: UITableViewCell,
        with menuItem: MenuItem,
        for tableView: UITableView,
        indexPath: IndexPath
    ) {
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = menuItem.price.formattedHundreds
        
        if let image = menuItem.image {
                cell.imageView?.image = image
        } else {
        NetworkManager().getImage(menuItem.imageURL) /* networkmanager.getImage - error */ {
            image, error in
            if let error = error {
                print(#line, #function, "ERROR", error.localizedDescription)
            }
            if let image = image {
            menuItem.image = image
            DispatchQueue.main.async {
               tableView.reloadRows(at: [indexPath], with: .automatic)
             }
          }
        }
     }
   }
} // конфигуратор ячейки menuItem, locaCapit. - Представление строки с заглавной буквы, созданное с использованием текущего языка + add to properties.
