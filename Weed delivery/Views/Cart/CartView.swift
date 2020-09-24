//
//  CartView.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 16.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}


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
                            VStack {
                                HStack(alignment: .bottom) {
                                    Text("Delivery")
                                        .font(.subheadline)
                                    Line()
                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [3.5]))
                                       .frame(height: 1)
                                    Text("49.9$")
                                        .font(.headline)
                                }
                                HStack(alignment: .bottom) {
                                    Text("Total")
                                        .font(.headline)
                                    Line()
                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [3.5]))
                                       .frame(height: 1)
                                    Text(String(cart.getSum() + 49.9) + "$")
                                        .font(.headline)
                                }
                            }
                            
                        }
                        .frame(width: geometry.size.width)
                        .offset(y: 20)
                        
                       
                    } else {
                        Text("No products in cart yet.")
                        Spacer()
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
                .padding(25)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
                .position( x: geometry.size.width / 2, y: geometry.size.height - 45)
                .fullScreenCover(isPresented: $isPresented, content: {
                    CheckoutView()
                })
                .onTapGesture {
                    self.isPresented = true
                }
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
