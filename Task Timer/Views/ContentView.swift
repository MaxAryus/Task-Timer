//
//  ContentView.swift
//  Task Timer
//
//  Created by Max Aryus on 02.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI


struct ContentView: View {

    
    
    
    @State var showSlider: Bool = true
    
    
    
    
    @State var workMinutes: Int = 0
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
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
            
            TaskTimer()
            
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
                    .shadow(color: .gray, radius: 9, x: 0, y: 3)
                
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
                .edgesIgnoringSafeArea(.bottom)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
