//
//  DatabaseManager.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 14.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import Foundation

class DatabaseManager: ObservableObject {
    @Published var companies = [Company]()
    
    func getAllCompanies() {
        let products = [
            Product(id: 1, name: "Big Mac Menu", price: 100.0),
            Product(id: 1, name: "Big Mac Menu", price: 100.0),
            Product(id: 1, name: "Big Mac Menu", price: 100.0),
            Product(id: 1, name: "Big Mac Menu", price: 100.0)
        ]
        
        companies = [
            Company(id: 1, name: "McDonalds", imageName: "mcdonalds", products: products),
            Company(id: 2, name: "McDonalds", imageName: "mcdonalds", products: nil),
            Company(id: 3, name: "McDonalds", imageName: "mcdonalds", products: products),
            Company(id: 4, name: "McDonalds", imageName: "mcdonalds", products: nil)
        ]
    }
}
