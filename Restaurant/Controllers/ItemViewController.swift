//
//  ItemViewController.swift
//  Restaurant
//
//  Created by Владимир on 29.01.2022.
//

import UIKit
class ItemViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var detailTextLabel: UILabel!
    @IBOutlet var addToOrderButton: UIButton!
    
    // MARK: Stored Properties
    
    var menuItem: MenuItem!
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - UI Methods
    
    func updateUI() {
        navigationItem.title = menuItem.name
        priceLabel.text = "\(menuItem.price)"
    }
    
    // MARK: Actions
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        
        
        
    }
}

