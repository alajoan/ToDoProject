//
//  TaskListViewModel.swift
//  ToDoProject
//
//  Created by Jonathan Alajoan Nascimento Rocha on 05/08/22.
//

import Foundation
import SwiftUI

@MainActor
class TaskListMainViewModel: ObservableObject {
    @Published var showingAddTodoView: Bool = false
    @Published var shouldShowAlert = false
    let coreDM: CoreDataManager?
    
    init() {
        coreDM = CoreDataManager()
    }
    
    func saveTask(name: String, priority: Priorities) {
        if name.isEmpty || name.count < 2 {
            shouldShowAlert = true
            return
        }
        coreDM?.saveTask(name: name, priority: priority)
    }
    
    func getTasks() -> [Todo] {
        guard let tasks = coreDM?.getAllTasks() else { return [] }
        return tasks
    }
}
