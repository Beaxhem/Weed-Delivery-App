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
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var showProductDetails = false
    
    var body: some View {
        if product != nil {
            
            VStack(alignment: .leading) {
                
                
                GeometryReader { geo in
                    Image(product!.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.width)
                        
                        
                        .cornerRadius(10)
                        .onTapGesture {
                            self.showProductDetails = true
                        }
                        
                }.scaledToFill()
                
                
                
                
                HStack {
                    Text(self.product!.name)
                        .font(.headline)
                    Spacer()
                    Group {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", 4.7))
                            .foregroundColor(.yellow)
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                
                Text("Test product description")
                    .font(.caption)
                    .foregroundColor(colorScheme == .dark ? .white : .init(UIColor.init(cgColor: CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.7))))
                    .padding([.top, .bottom], 5)
                Text(String(self.product!.price) + "$")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                
            }
            
            
            .sheet(isPresented: $showProductDetails) {
                ProductDetails(product: self.product!)
            }
            .padding(.bottom)
            
        }
    }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(id: 1, name: "Big Mac Menu", price: 100.0, category: "Menu"))
    }
}
