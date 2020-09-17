//
//  CartItem.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 18.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import Foundation

class CartItem: Identifiable {
    var id: Int
    var product: Product
    var count: Int
    
    init(id: Int, product: Product, count: Int = 1) {
        self.id = id
        self.product = product
        self.count = count
    }
    
    func increment() {
        self.count += 1
    }
    
    func decrement() {
        if self.count > 1 {
            self.count -= 1
        }
    }
}
