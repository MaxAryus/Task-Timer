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
                        Image("AddTaskButton")
                        .resizable()
                            .frame(width: 55, height: 55).padding(.trailing, 21)
                            .shadow(color: gray, radius: 6, x: 0, y: 3)
                            .foregroundColor(green)
                    }
                }
                .padding(.top, 10)
                List {
                    ForEach(self.taskListVM.tasks, id: \.id) { item in
                        HStack {
                            Text("\(item.title)")
                                .font(.custom("Nunito-SemiBold", size: 22))
                                .foregroundColor(gray)
                                .lineLimit(2)
                            Spacer()
                            Image(systemName: "square")
                                .resizable()
                                .foregroundColor(green)
                                .frame(width: 22, height: 22)
                        }
                    }.onDelete { (offsets) in
                        offsets.forEach { (index) in
                            let p = self.taskListVM.tasks[index]
                            self.taskListVM.deleteTask(id: p.id)
                            }
                    }
                }.shadow(color: .gray, radius: 6, x: 0, y: 3)
                
                
            }
            if self.showAddTaskSheet == true {
                
                AddTaskSheet(showAddTaskSheet: self.$showAddTaskSheet) { (success) in
                    if success == true {
                        self.taskListVM.fetchAllTasks()
                    }
                    
                }.transition(.move(edge: .bottom))

            }
        
        }

    }
    
}
