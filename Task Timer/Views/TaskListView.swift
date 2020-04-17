//
//  TaskListViewModel.swift
//  Task Timer
//
//  Created by Max Aryus on 11.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    
    @State var showAddTaskSheet: Bool = false
    @ObservedObject var taskListVM = ListViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("\(DataManager.shared.getTasks().count) Tasks remaining")
                        .font(.custom("Nunito-Bold", size: 11))
                        .shadow(color: gray, radius: 6, x: 0, y: 3)
                        .padding(.leading, 21)
                    Spacer()
                    Button(action: {
                        self.showAddTaskSheet.toggle()
                        
                    }) {
                        Image("addTaskButton")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 45, height: 45).padding(.trailing, 21)
                            .shadow(color: gray, radius: 6, x: 0, y: 3)
                            .foregroundColor(green)
                            .rotationEffect(Angle.init(degrees: (self.showAddTaskSheet ? 45 : 0))).animation(.spring())
                    }
                }
                .padding(.top, 10)
                
//                HStack {
//                    if self.taskListVM.tasks.count == -1 {
//                        Text("No tasks 😁").background(green)
//                    } else {
                        List {
                            ForEach(self.taskListVM.tasks, id: \.id) { item in
                                HStack {
                                    Text("\(item.title)")
                                        .font(.custom("Nunito-SemiBold", size: 22))
                                        .foregroundColor(gray)
                                        .lineLimit(2)
                                    Spacer()
                                    Button(action: {
                                        self.taskListVM.fetchAllTasks()
                                        self.taskListVM.deleteTask(id: item.id)
                                    }) {
                                        Image(systemName: "square")
                                            .resizable()
                                            .foregroundColor(green)
                                            .frame(width: 22, height: 22)
//                                    }
//                                }
                            }
                            
                        }
                    }
                }.shadow(color: .gray, radius: 6, x: 0, y: 3)
            }
            if self.showAddTaskSheet {
                
                AddTaskSheet(showAddTaskSheet: self.$showAddTaskSheet, onSave: { (success) in
                    if success {
                        self.taskListVM.fetchAllTasks()
                    }
                }).transition(.move(edge: .bottom)).padding(.top, 100)
                
            }
        }

    }
    
}
