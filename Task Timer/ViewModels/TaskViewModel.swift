//
//  TaskViewModel.swift
//  Task Timer
//
//  Created by Max Aryus on 12.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation

class TaskViewModel {
    var id: UUID
    var title: String
    var finished: Bool
    
    init(id: UUID, title: String, finished: Bool) {
        self.id = id 
        self.title = title
        self.finished = finished
    }
}
