//
//  ContentView.swift
//  ToDoProject
//
//  Created by Jonathan Alajoan Nascimento Rocha on 04/08/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    //MARK: - Properties
    @State private var showingAddTodoView: Bool = false
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List (0..<5) { item in
                Text("Text")
            }
            .navigationBarTitle("To do")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showingAddTodoView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddTodoView) {
                AddToDoView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
