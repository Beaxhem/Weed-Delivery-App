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
    @State var rating: Float = 0.0
    
    var body: some View {
        Button(action: {
            self.showModal = true
        }) {
            VStack(alignment: .leading) {
                Image(company.imageName)
                    .resizable()
                    .frame(height: 150)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                HStack {
                    Text(company.name)
                        .font(.headline)
                    
                    Group {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", rating))
                            .foregroundColor(.yellow)
                            .font(.subheadline)
                            .fontWeight(.bold)
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
        .buttonStyle(PlainButtonStyle())
        .onAppear(perform: getRating)
        .sheet(isPresented: $showModal) {
            CompanyDetailView(company: self.company)
        }
    }
    
    func getRating() {
        let id = company.id
        
        DatabaseManager.shared.getCompanyRating(by: id) {res in
            
            switch res {
            case .success(let r):
                self.rating = r
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct CompanyRow_Previews: PreviewProvider {
    static var previews: some View {
        CompanyRow(company: Company(id: 1, name: "Test company", imageName: "mcdonalds", products: nil))
    }
}
