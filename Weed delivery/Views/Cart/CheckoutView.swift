//
//  CheckoutView.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 20.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            CloseBar()
                .onTapGesture {
                    self.close()
                }
        }
    }
    
    func close() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
