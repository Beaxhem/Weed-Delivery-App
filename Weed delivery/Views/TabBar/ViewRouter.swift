//
//  ViewRouter.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 15.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentViewIdx = 0
    @Published var views = [
        AnyView(CompaniesView())
    ]

}
