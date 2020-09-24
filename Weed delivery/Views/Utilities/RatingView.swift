//
//  Rating.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 21.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    var rating: Float
    
    var body: some View {
        Group {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.yellow)
            Text(String(format: "%.1f", rating))
                .foregroundColor(.yellow)
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4.7)
    }
}
