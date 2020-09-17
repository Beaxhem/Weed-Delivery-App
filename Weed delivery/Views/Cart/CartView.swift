//
//  CartView.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 16.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CartView: View {
    @State var cart: [CartItem] = []
    
    @Environment(\.presentationMode) var presentationMode
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .trailing) {
                Image("close")
                    .resizable()
                    
                    .frame(width: 30, height: 30)
                    .offset(x: -20, y: 20)
                    .onTapGesture {
                       self.presentationMode.wrappedValue.dismiss()
                    }
                    
                       
                
                List {
                    ForEach(self.cart)  { item in
                        CartItemView(item: item)
                    }.onDelete(perform: self.deleteItems)
                }
                
            
                .frame(width: geometry.size.width)
                .offset(y: 20)
                Spacer(minLength: 20)
                
            }
            
            .onAppear(perform: self.getCart)
        }
    }
    
    func getCart() {
        
        let cart = appDelegate.cart
        
        self.cart = cart
    }

    func deleteItems(at offsets: IndexSet) {
        self.cart.remove(atOffsets: offsets)
        
        appDelegate.cart = cart
        
    
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
