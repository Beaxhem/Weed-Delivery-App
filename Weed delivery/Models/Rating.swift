//
//  Rating.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 18.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import Foundation

class Rating {
    var id: Int
    var rating: Float
    
    init(id: Int, rating: Float) {
        self.id = id
        self.rating = rating
    }
}
