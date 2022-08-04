//
//  AddToDoView.swift
//  ToDoProject
//
//  Created by Jonathan Alajoan Nascimento Rocha on 04/08/22.
//

import SwiftUI

struct AddToDoView: View {
    
    //MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: Priorities = .normal
    
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
                        print("Save a new todo item")
                    }) {
                        Text("Save")
                    }

                }
                Spacer()
            }
            .navigationBarTitle("New To do")
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
struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
    }
}
