//
//  CartView.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 16.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CartView: View {
    @State var cart: Cart = (UIApplication.shared.delegate as! AppDelegate).cart
    @State var isPresented = false
    
    @Environment(\.presentationMode) var presentationMode
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .trailing) {
                    CloseBar()
                        .onTapGesture {
                            self.close()
                        }
                    
                           
                    if self.cart.items.count > 0 {
                        List {
                            ForEach(self.cart.items)  { item in
                                CartItemView(item: item)
                            }.onDelete(perform: self.deleteItems)
                            
                        }
                        .frame(width: geometry.size.width)
                        .offset(y: 20)
                    } else {
                        Text("No products in cart yet.")
                    }
                    
                    TabBarSpacer()
                    
                }
                
                .onAppear(perform: self.getCart)
                
                HStack {
                   Text("Proceed to checkout")
                }
                    .frame(width: geometry.size.width - 65)
                    .foregroundColor(.white)
                    .font(.headline)
                    .onTapGesture {
                        self.isPresented = true
                    }
                    .padding(25)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .position( x: geometry.size.width / 2, y: geometry.size.height - 45)
                    .fullScreenCover(isPresented: $isPresented, content: {
                        CheckoutView()
                    })
                    
                    
            }
            
        }
    }
    
    func close() {
        self.presentationMode.wrappedValue.dismiss()
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
        CartView(cart: Cart(items: []))
    }
}
