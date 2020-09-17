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
    
    func getRating(by id: Int, completion: @escaping (Result<Float, Error>) -> Void) {
        let ratings = [
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
