//
//  BarView.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 20.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CloseBar: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "multiply")
                .resizable()
                .position(y: 15)
                .frame(width: 15, height: 15)
                .offset(x: -10)
           
        }
        .frame(height: 50)
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        CloseBar()
    }
}
