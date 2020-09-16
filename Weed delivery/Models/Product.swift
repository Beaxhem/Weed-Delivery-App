//
//  Products.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 15.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import Foundation

class Product: Identifiable {
    var id: Int
    var name: String
    var price: Float
    
    init(id: Int, name: String, price: Float) {
        self.id = id
        self.name = name
        self.price = price
    }
}
