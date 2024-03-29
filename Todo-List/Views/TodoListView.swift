//
//  TodoListView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import SwiftUI
//  all todo lists
struct TodoListView: View {
    @ObservedObject var todosViewModel: TodoViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(todosViewModel.todos) { todo in
                        ListRowView(todosViewModel: todosViewModel, todo: todo)
                    }
                    .onDelete(perform: todosViewModel.deleteItem)
                    .onMove(perform: todosViewModel.moveItem)
                }
            }
            .navigationTitle("To-do")
            .toolbar {
                NavigationLink("New To-do") {
                    AddNewTodoView(todosViewModel: todosViewModel)
                }
            }
        }
    }
    
    
}
