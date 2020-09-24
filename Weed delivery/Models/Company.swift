//
//  Company.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 14.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import Foundation

class Company: Identifiable {
    var id: Int
    var name: String
    var description: String
    var imageName: String
    var products: [Product]?

    init(id: Int, name: String, imageName: String, products: [Product]?) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.products = products
        self.description = ""
    }
    
    init(id: Int, name: String, description: String, imageName: String, products: [Product]?) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.products = products
        self.description = description
    }
}
