//
//  TabBar.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 14.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    @ObservedObject var viewRouter = ViewRouter()
    @State var currentView: AnyView
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                self.currentView
                    
                    .frame(height: geometry.size.height - geometry.safeAreaInsets.bottom - 50)
                    
                
                HStack {
                    Button(
                        action: {
                            self.viewRouter.currentViewIdx = 0
                            self.getCurrentView()
                    },
                        label: {
                            Image(systemName: "paperplane.fill").imageScale(.large)
                    })
                    Spacer()
                    Button(
                        action: {
                            self.viewRouter.currentViewIdx = 1
                            self.getCurrentView()
                    },
                        label: {
                            Image(systemName: "paperplane.fill").imageScale(.large)
                    })
                    Spacer()
                    
                    Button(
                        action: {
                            self.viewRouter.currentViewIdx = 2
                            self.getCurrentView()
                    },
                        label: {
                            Image(systemName: "paperplane.fill").imageScale(.large)
                    })
                    
                }
                .padding(25)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(width: geometry.size.width - 20)
//                .position( x: geometry.size.width / 2, y: geometry.size.height - 40)
            }
            .onAppear(perform: self.initTabBar)
            
        }
        
    }
    
    func initTabBar() {
        currentView = viewRouter.views[0]
    }
    
    func getCurrentView() {
        switch self.viewRouter.currentViewIdx {
        case 0:
            self.currentView = AnyView(CompaniesView())
        default:
            self.currentView = AnyView(Text("Hello"))
        }
    }
    
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentView: AnyView(CompaniesView()))
    }
}
