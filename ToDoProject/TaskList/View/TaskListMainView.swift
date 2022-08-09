//
//  TaskListMainView.swift
//  ToDoProject
//
//  Created by Jonathan Alajoan Nascimento Rocha on 04/08/22.
//

import SwiftUI
import CoreData

struct TaskListMainView: View {
    
    //MARK: - Properties
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject var viewModel = TaskListMainViewModel()
    @State private var tasks: [Todo] = [Todo]()
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(self.tasks, id: \.self) { tasks in
                    HStack {
                        Text(tasks.name ?? "")
                        Spacer()
                        Text(tasks.priority ?? "")
                    }
                }
            }
            .navigationBarTitle("To do")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingAddTodoView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingAddTodoView) {
                TaskListAddToDoView().environment(\.managedObjectContext, self.managedObjectContext)
            }
        }
    }
}

struct TaskListMainView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListMainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
