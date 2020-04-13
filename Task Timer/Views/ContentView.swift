//
//  ContentView.swift
//  Task Timer
//
//  Created by Max Aryus on 02.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var workMinutes: Int = 0
    @State var showMenu: Bool = false
   
    
    var body: some View {
        
    return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                MainView(showMenu: self.$showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                if self.showMenu {
                    MenuView()
                        .frame(width: geometry.size.width/2)
                        .transition(.move(edge: .leading))
                }
                
            }
        }
    
    }
    
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {

    @Binding var showMenu: Bool

    var body: some View {
        VStack {
            TaskTimer(showMenu: $showMenu)
            Spacer()
            Spacer()
            TaskListView()
        }.edgesIgnoringSafeArea(.bottom)
    }
}

