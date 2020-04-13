//
//  ListViewModel.swift
//  Task Timer
//
//  Created by Max Aryus on 12.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI
import Combine

class ListViewModel: ObservableObject {
    @Published
    var tasks = [TaskViewModel]()
    
    init() {
        fetchAllTasks()
    }
    
    func fetchAllTasks() {
        self.tasks = DataManager.shared.getTasks().map({ (task) -> TaskViewModel in
            return TaskViewModel(id: task.id!, title: task.title!, finished: task.finished)
            
        })
        print(self.tasks)
    }
    
    func deleteTask(id: UUID) {
        DataManager.shared.deleteTasks(id: id)
        self.tasks.removeAll { (pvm) -> Bool in
            return pvm.id == id
            
        }
    }
}
