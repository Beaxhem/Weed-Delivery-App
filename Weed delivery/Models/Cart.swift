//
//  Cart.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 20.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import Foundation

class Cart {
    var items: [CartItem]
    
    init(items: [CartItem]) {
        self.items = items
    }
    
    func addToCart(product: Product) {
        
        for item in items {
            if item.product.id == product.id {
                print(item.product.name)
                print(product.name)
                item.count += 1
                return
            }
        }
        
        items.append(CartItem(id: 0, product: product))
    }
    
    func remove(atOffsets offset: IndexSet) {
        self.items.remove(atOffsets: offset)
    }
    
    func getSum() -> Float {
        if self.items.count > 0 {
            var total: Float = 0.0
            
            for item in self.items {
                total += Float(item.count) * item.product.price
            }
            
            return total
        } else {
            return 0.0
        }
    }
}
