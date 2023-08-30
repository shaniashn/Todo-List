//
//  AddNewTodoView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import SwiftUI

struct AddNewTodoView: View {
    @ObservedObject var todosViewModel: TodoViewModel
    
    @Binding var isPresented: Bool
    
    @State var index: Int = 0
    @State var inputTitle: String = ""
    @State var inputTask: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Title")
                        .font(.system(size: 28, weight: .regular))
                    TextField("Input title", text: $inputTitle)
                }
                .padding()
                
                VStack {
                    Text("List of task")
                            .font(.system(size: 18, weight: .regular))
                    HStack {
                        TextField("Input task", text: $inputTask)
                        Button {
                            todosViewModel.addTask(task: Tasks(id: index, task: inputTask))
                            inputTask = ""
                            index += 1
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    VStack {
                        List {
                            ForEach(todosViewModel.tasks) { task in
                                Text(task.task)
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
                        todosViewModel.addTodo(todo: Todo(id: UUID(), title: inputTitle, tasks: todosViewModel.tasks))
                        print(todosViewModel.todos)
                        isPresented.toggle()
                    }
                }
            }
        }
    }
}

//struct AddNewTodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewTodoView()
//    }
//}
