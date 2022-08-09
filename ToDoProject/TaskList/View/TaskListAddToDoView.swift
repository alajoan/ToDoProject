//
//  TaskListAddToDoView.swift
//  ToDoProject
//
//  Created by Jonathan Alajoan Nascimento Rocha on 04/08/22.
//

import SwiftUI

struct TaskListAddToDoView: View {
    
    //MARK: - Properties
    @State private var name: String = ""
    @State private var priority: Priorities = .normal
    @StateObject var viewModel = TaskListMainViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("To do: ", text: $name)
                    Picker("Priority", selection: $priority) {
                        ForEach(Priorities.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
                        viewModel.saveTask(name: self.name, priority: self.priority)
                        if viewModel.shouldShowAlert == false {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        
                    }) {
                        Text("Save")
                    }
                    .alert(isPresented:$viewModel.shouldShowAlert) {
                        Alert(
                            title: Text("Erro ao cadastrar task"),
                            message: Text("Sua task deve ter no minimo 2 palavras de titulo"),
                            dismissButton: .default(Text("Ok"))
                        )
                    }
                }
                Spacer()
            }
            .navigationBarTitle("New Task To do")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

//MARK: - Preview
struct TaskListAddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListAddToDoView()
    }
}
