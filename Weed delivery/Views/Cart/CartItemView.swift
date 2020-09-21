//
//  CartItemView.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 16.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CartItemView: View {
    var item: CartItem
    
    var body: some View {
        HStack {
            Image(item.product.imageName)
                .resizable()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                
                    Text(item.product.name)
                        .font(.headline)
                    
                    Text("\(item.product.price)$ * \(item.count) = " + String(item.product.price * Float(item.count)) + "$")
                        .font(.system(size: 20, weight: .bold, design: .default))
                
                
                Text("Item description")
                    .font(.subheadline)
            }
        }
        
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CartItemView(item: CartItem(id: 1, product: Product(id: 1, name: "McDonalds", price: 99.9, category: "Menu")))
        }
        
    }
}
