//
//  CartItemView.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 16.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CartItemView: View {
    var item: Product
    
    var body: some View {
        HStack {
            Image("mcdonalds")
                .resizable()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                        .font(.headline)
                    
                    Text(String(item.price) + "$")
                        .font(.system(size: 20, weight: .bold, design: .default))
                }
                
                Text("Item description")
                    .font(.subheadline)
            }
        }
        
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CartItemView(item: Product(id: 1, name: "McDonalds", price: 99.9))
        }
        
    }
}
