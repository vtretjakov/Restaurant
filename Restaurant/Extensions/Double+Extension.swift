//
//  Double+Extension.swift
//  Restaurant
//
//  Created by Владимир on 02.02.2022.
//

import Foundation

extension Double {
    var formattedHundreds: String {
        return String(format: "$%.2f", self)
    }
} 
