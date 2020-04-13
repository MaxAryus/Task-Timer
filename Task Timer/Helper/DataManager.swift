//
//  DataManager.swift
//  Task Timer
//
//  Created by Max Aryus on 11.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    
    static let shared = DataManager(context: NSManagedObjectContext.current)
    
    var context: NSManagedObjectContext
    
    private init(context: NSManagedObjectContext) {
        self.context = context
    }
    
// get all Tasks
    func getTasks() -> [Tasks] {
        var tasks = [Tasks]()
        
        let taskRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do {
            tasks = try self.context.fetch(taskRequest)
        } catch let error as NSError {
            print(error)
        }
        return tasks
    }
    
// saving tasks
    
    func saveTasks(title: String, finished: Bool) {
        let task = Tasks(context: self.context)
        
        task.id = UUID()
        task.title = title
        task.finished = finished
        
        do {
            try self.context.save()
        } catch let error as NSError {
            print(error)
        }
        
    }
    
// delete tasks
    
    func deleteTasks(id: UUID) {
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        
        do {
            let fetchTasks = try context.fetch(fetchRequest)
            
            for tk in fetchTasks {
                context.delete(tk)
            }
            
        } catch let error as NSError {
            print(error)
        }
        
    }
    
}
