//
//  AddTaskViewModel.swift
//  Task Timer
//
//  Created by Max Aryus on 11.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation

class AddTaskViewModel {
    var title = ""
    var finished = false
    
    func saveTask(saved: @escaping () -> Void) {
        DataManager.shared.saveTasks(title: self.title, finished: self.finished)
        saved()
    }
}
