//
//  CompanyRow.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 14.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CompanyRow: View {
    @State private var showModal = false
    
    var company: Company
    
    var body: some View {
        Button(action: {
            self.showModal = true
        }) {
            VStack(alignment: .leading) {
                    Image(company.imageName)
                        .resizable()
                        .frame(height: 150)
                        .cornerRadius(10)
                        
                    Text(company.name)
                        .font(.headline)
                
                    
                }
        
                .padding([.leading, .trailing])
                .padding(.top, 10)
            
                
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showModal) {
            CompanyDetailView(company: self.company)
        }
    }
}

struct CompanyRow_Previews: PreviewProvider {
    static var previews: some View {
        CompanyRow(company: Company(id: 1, name: "Test company", imageName: "mcdonalds", products: nil))
    }
}
