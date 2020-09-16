//
//  ProductVIew.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 15.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    var product: Product?
    
    @State var showProductDetails = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if product != nil {
                Image("mcdonalds")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 165, height: 165)
                    
                    .cornerRadius(10)
                    .onTapGesture {
                        self.showProductDetails = true
                }

                
                VStack(alignment: .leading) {
                    Text(self.product!.name)
                        .font(.headline)
                    Text("Test product description")
                        .font(.caption)
                        .foregroundColor(.init(UIColor.init(cgColor: CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.7))))
                        .padding([.top, .bottom], 5)
                    Text(String(self.product!.price) + "$")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
                
            }
        }
        .sheet(isPresented: $showProductDetails) {
            ProductDetails(product: self.product!)
        }
        .padding(.bottom)
    
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(id: 1, name: "Big Mac Menu", price: 100.0))
    }
}
