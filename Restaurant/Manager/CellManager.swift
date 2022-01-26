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
    
    func configure(_ cell: UITableViewCell, with menuItem: MenuItem) {
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        
        // TODO: load picture
        
        
    }
    
} // locaCapit. - Представление строки с заглавной буквы, созданное с использованием текущего языка + add to properties.
