//
//  CartButton.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 15.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CartButton: View {
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    @State var sum: Float = 0.0
    
    var body: some View {
        HStack {
            Image(systemName: "bag.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
                
            Text("Cart")
                .foregroundColor(.white)
                .font(.headline)
            Spacer()
            
            Text(String(sum) + "$")
                .foregroundColor(.white)
        }
        .onAppear(perform: getSum)
    }
    
    func getSum() {
        sum = appDelegate.cart.getSum()
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
    }
}
