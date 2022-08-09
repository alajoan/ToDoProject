//
//  ToDoProjectApp.swift
//  ToDoProject
//
//  Created by Jonathan Alajoan Nascimento Rocha on 04/08/22.
//

import SwiftUI

@main
struct ToDoProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListMainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
