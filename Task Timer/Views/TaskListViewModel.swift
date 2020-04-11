//
//  TaskListViewModel.swift
//  Task Timer
//
//  Created by Max Aryus on 11.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct TaskListViewModel: View {
    
    @State var showAddTaskSheet: Bool = false 
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("1 Task remaining")
                    .font(.custom("Nunito-Bold", size: 11))
                    .shadow(color: gray, radius: 6, x: 0, y: 3)
                    .padding(.leading, 21)
                Spacer()
                Button(action: {
                    self.showAddTaskSheet = true
                }) {
                    Image("addButton")
                    .resizable()
                        .frame(width: 55, height: 55).padding(.trailing, 21)
                        .shadow(color: gray, radius: 6, x: 0, y: 3)
                }
            }.sheet(isPresented: $showAddTaskSheet) {
                AddTaskSheet(showAddTaskSheet: self.showAddTaskSheet)
            }
            Spacer()
            Spacer()
            List {
                HStack {
                    
                    Text("Homework")
                        .font(.custom("Nunito-SemiBold", size: 22))
                        .foregroundColor(gray)

                    Spacer()
                    Image(systemName: "square")
                        .resizable()
                        .foregroundColor(green)
                        .frame(width: 22, height: 22)
                }.frame(height: rowHight)
                
            }.shadow(color: .gray, radius: 9, x: 0, y: 3)
        }
        
    }
}
