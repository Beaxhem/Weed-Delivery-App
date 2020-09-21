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
    
    static let shared = DatabaseManager()
    
    func getAllCompanies() {
        sleep(2)
        let description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        let McDonaldsProducts = [
            Product(id: 7, name: "Big Mac Menu", price: 100.0, category: "Menu", description: description),
            Product(id: 8, name: "Big Mac Menu", price: 100.0, category: "Menu", description: description),
            Product(id: 9, name: "Big Mac Menu", price: 100.0, category: "Menu", description: description),
            Product(id: 10, name: "Big Mac Menu", price: 100.0, category: "Menu", description: description),
            
        ]
        
        let mafiaProducts = [
            Product(id: 0, name: "Chicken soup", price: 69, category: "soups", description: description, imageName: "1"),
            Product(id: 1, name: "Chicken soup", price: 69, category: "soups", description: description, imageName: "1"),
            Product(id: 2, name: "Chicken soup", price: 69, category: "soups", description: description, imageName: "1"),
            Product(id: 3, name: "California L", price: 399, category: "rolls", description: description, imageName: "2"),
            Product(id: 4, name: "Cesar Salad", price: 145, category: "salads", description: description, imageName: "3"),
            Product(id: 5, name: "Cheese cake", price: 79, category: "desserts", description: description, imageName: "4"),
            Product(id: 6, name: "Hunter's pizza", price: 139, category: "pizzas", description: description, imageName: "5")
        ]
        
        companies = [
            Company(id: 0, name: "Mafia", imageName: "mafia", products: mafiaProducts),
            Company(id: 1, name: "McDonalds", imageName: "mcdonalds", products: McDonaldsProducts),
            Company(id: 2, name: "KFC", imageName: "kfc", products: nil),
            Company(id: 4, name: "In-N-Out", imageName: "innout", products: nil)
        ]
    }
    
    func getRating(by id: Int, completion: @escaping (Result<Float, Error>) -> Void) {
        let ratings = [
            0: [
                Rating(id: 1, rating: 5.0),
                Rating(id: 2, rating: 5.0),
                Rating(id: 3, rating: 5.0)
            ],
            1: [
                Rating(id: 1, rating: 5.0),
                Rating(id: 2, rating: 4.7),
                Rating(id: 3, rating: 4.2)
            ],
            2: [
                Rating(id: 1, rating: 4.0),
                Rating(id: 2, rating: 4.7),
                Rating(id: 3, rating: 4.2)
            ],
            3: [
                Rating(id: 1, rating: 5.0),
                Rating(id: 2, rating: 4.7),
                Rating(id: 3, rating: 5.0)
            ],
            4: [
                Rating(id: 1, rating: 5.0),
                Rating(id: 2, rating: 4.7),
                Rating(id: 3, rating: 5.0)
            ]
        ]
        
        var rating: Float = 0
        
        let productRatings = ratings[id]!
        for r in productRatings {
            rating += r.rating
        }
        
        rating /= Float(productRatings.count)
        
        completion(.success(rating))
    }
}
