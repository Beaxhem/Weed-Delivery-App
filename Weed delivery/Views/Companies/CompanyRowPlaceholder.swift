//
//  CompanyRowPlaceholder.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 20.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CompanyRowPlaceholder: View {
    @State var imageWidth = CGFloat(100)
    
    var repeatingAnimation: Animation {
        Animation.spring()
                .repeatForever()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geo in
                Rectangle()
                    .frame(width: self.imageWidth, height: 150)
                    .cornerRadius(10)
                    .foregroundColor(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)))
                    .onAppear() {
                        withAnimation(self.repeatingAnimation) { self.imageWidth = geo.size.width }
                    }
            }
            
            HStack {
                Text("")
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.headline)
                
                Group {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.yellow)
                    //                    Text(String(format: "%.1f", rating))
                    //                        .foregroundColor(.yellow)
                    //                        .font(.subheadline)
                    //                        .fontWeight(.bold)
                }
                Spacer()
                
                Group {
                    Image(systemName: "car")
                        .resizable()
                        .frame(width: 15, height: 15)
                    
                    Text("20-25 min")
                        
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
        }
        .padding([.leading, .trailing])
        .padding(.top, 10)
    }
}

struct CompanyRowPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        CompanyRowPlaceholder()
    }
}
