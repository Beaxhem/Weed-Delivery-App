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
    
    var body: some View {
        NavigationView {
            ScrollView {
                if !db.companies.isEmpty {
                    VStack {
                        ForEach(0..<db.companies.count) { company in
                            CompanyRow(company: self.db.companies[company])
                        }
                        TabBarSpacer()
                    }
                }
            }
            .navigationBarTitle("Companies")
            .onAppear(perform: getCompanies)
        }
    }
    
    func getCompanies() {
        db.getAllCompanies()
    }
}

struct CompaniesView_Previews: PreviewProvider {
    static var previews: some View {
        CompaniesView()
    }
}
