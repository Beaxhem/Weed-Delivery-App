//
//  ProductsListView.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 15.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct ProductsListView: View {
    var products: [Product]?
    
    @State var productsIndexes: [Int] = []
    
    var body: some View {
        Group {
            if self.products!.count > 0 {
                VStack {
                    ForEach(productsIndexes, id: \.hashValue) { idx in
                        HStack {
                            Spacer()
                            ProductView(product: self.products?[idx])
                            Spacer()
                            ProductView(product: self.products?[idx])
                            Spacer()
                        }
                        
                    }
                    TabBarSpacer()
                    
                }.onAppear(perform: getIndexes)
            } else {
                Text("No products available")
            }
        }
        
        
    }
    
    func getIndexes() {
        var result = [Int]()
        if products != nil {
            for idx in stride(from: 0, through: products!.count-1, by: 2) {
                result.append(idx)
            }
            
            productsIndexes = result

        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(products: [Product(id: 1, name: "Big Mac Menu", price: 100.0),
        Product(id: 1, name: "Big Mac Menu", price: 100.0),
        Product(id: 1, name: "Big Mac Menu", price: 100.0),
        Product(id: 1, name: "Big Mac Menu", price: 100.0)])
    }
}
