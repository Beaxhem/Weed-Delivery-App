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
    var category: String
    var description: String
    var imageName: String
    
    init(id: Int, name: String, price: Float, category: String, description: String) {
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
        self.imageName = ""
    }
    
    init(id: Int, name: String, price: Float, category: String) {
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = ""
        self.imageName = ""
    }
    
    init(id: Int, name: String, price: Float, category: String, description: String, imageName: String) {
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
        self.imageName = imageName
    }
}
