//
//  CartButton.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 15.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CartButton: View {
    let cart = (UIApplication.shared.delegate as! AppDelegate).cart
    
    var body: some View {
        HStack {
            Image("cart")
                .resizable()
                .frame(width: 25, height: 25)
                
            Text("Cart")
                .foregroundColor(.white)
                .font(.headline)
            Spacer()
            
            Text(String(getSum()) + "$")
                .foregroundColor(.white)
        }
    }
    
    func getSum() -> Float {
        var total: Float = 0
        
        for item in cart {
            total += item.product.price * Float(item.count)
        }
        
        return total
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
    }
}
