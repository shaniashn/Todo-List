//
//  AddNewTodoView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import SwiftUI

struct AddNewTodoView: View {
    @ObservedObject var todosViewModel: TodoViewModel
    
    @State var index: Int = 0
    @State var inputTitle: String = ""
    @State var inputTask: String = ""
    @State var isCompleted: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Title")
                        .font(.system(size: 22, weight: .regular))
                    TextField("Input title", text: $inputTitle)
                }
                .padding()
                
                VStack(alignment: .leading){
                    Text("List of task")
                            .font(.system(size: 18, weight: .regular))
                    HStack {
                        TextField("Input task", text: $inputTask)
                        Button {
                            todosViewModel.addTask(task: Tasks(id: UUID(), task: inputTask, isCompleted: isCompleted))
                            inputTask = ""
                            index += 1
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    VStack {
                        List {
                            ForEach(todosViewModel.tasks) { task in
                                HStack {
                                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                                    Text(task.task)
                                }
                                .onTapGesture {
                                    todosViewModel.updatedTask(theTask: task)
                                }
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Add New")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        todosViewModel.addTodo(todo: Todo(id: UUID().uuidString, title: inputTitle, isCompleted: false, tasks: todosViewModel.tasks))
                    }
                }
            }
            
        }
        
    }
}
