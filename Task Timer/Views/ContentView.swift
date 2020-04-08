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
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
        }
        
        let dragToMenue = DragGesture()
            .onEnded {
                if $0.translation.width < 300 {
                    withAnimation {
                        self.showMenu = true
                    }
                }
        }

        return GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(workMinutes: self.$workMinutes, showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .gesture(dragToMenue)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                    
                }
                .gesture(drag)
            }
        }
    
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    
    @Binding var workMinutes: Int
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                    
                }) {
                    MenueButton()
                }
                Spacer()
                VStack {
                    Text("\(workMinutes) Minutes \n worked today")
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .padding(.trailing)
                        .font(.custom("Nunito-SemiBold", size: 11))
                        .shadow(color: .gray, radius: 6, x: 0, y: 3)
                }
            }.padding(.top)
            
            TaskTimer(workedTime: $workMinutes)
            
            Spacer()
            HStack {
                Text("1 Task remaining")
                    .font(.custom("Nunito-Bold", size: 11))
                    .shadow(color: .gray, radius: 6, x: 0, y: 3)
                    .padding(.leading, 21)
                Spacer()
                Image("addButton")
                .resizable()
                    .frame(width: 55, height: 55).padding(.trailing, 21)
                    .shadow(color: gray, radius: 6, x: 0, y: 3)
                
            }
            Spacer()
            
            List {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Homework")
                            .font(.custom("Nunito-SemiBold", size: 20))
                            .foregroundColor(gray)
                        Text("10 Minutes past")
                            .font(.custom("Nunito-ExtraLight", size: 11))
                            .foregroundColor(gray)
                    }
                    Spacer()
                    Image(systemName: "square")
                        .resizable()
                        .foregroundColor(green)
                        .frame(width: 22, height: 22)
                }
                
            }.shadow(color: .gray, radius: 9, x: 0, y: 3)
                
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct MenueButton: View {
    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 11, height: 11)
                .foregroundColor(blue)
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 11, height: 11)
                .foregroundColor(blue)
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 11, height: 11)
                .foregroundColor(blue)
            
        }.shadow(color: .gray, radius: 6, x: 0, y: 3)
            .padding(.leading, 21)
    }
}
