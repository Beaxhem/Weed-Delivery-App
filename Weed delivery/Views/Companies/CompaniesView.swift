//
//  CompniesView.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 14.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct CompaniesView: View {
    @ObservedObject var db = DatabaseManager()
    @State var isLoading = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                if isLoading {
                    VStack {
                        ForEach(0..<4) { _ in
                            CompanyRow(company: Company(id: 1, name: "Test company", imageName: "mcdonalds", products: nil))
                            CompanyRow(company: Company(id: 1, name: "Test company", imageName: "mcdonalds", products: nil))
                            CompanyRow(company: Company(id: 1, name: "Test company", imageName: "mcdonalds", products: nil))
                            CompanyRow(company: Company(id: 1, name: "Test company", imageName: "mcdonalds", products: nil))
                        }
                        .redacted(reason: .placeholder)
                    }
                } else {
                    if !db.companies.isEmpty {
                        VStack {
                            ForEach(0..<db.companies.count) { company in
                                CompanyRow(company: self.db.companies[company])
                            }
                            TabBarSpacer()
                        }
                    }
                }
                
            }
            .navigationBarTitle("Companies")
            .onAppear(perform: getCompanies)
            
        }
    }
    
    func getCompanies() {
        DispatchQueue.main.async {
            db.getAllCompanies()
            withAnimation() {
                self.isLoading.toggle()
            }
            
        }
        
       
    }

}

struct CompaniesView_Previews: PreviewProvider {
    static var previews: some View {
        CompaniesView()
    }
}
