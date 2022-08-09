//
//  CoreDataManager.swift
//  ToDoProject
//
//  Created by Jonathan Alajoan Nascimento Rocha on 05/08/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "ToDoProject")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func getAllTasks() -> [Todo] {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveTask(name: String, priority: Priorities) {
        let task = Todo(context: persistentContainer.viewContext)
        task.name = name
        task.priority = priority.priorityString
        
        do {
            try persistentContainer
                .viewContext.save()
        } catch {
            print("Failed to save task")
        }
    }
}
