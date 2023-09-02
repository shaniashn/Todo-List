//
//  TodoListView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import SwiftUI

struct TodoListView: View {
    @State var isPresented = false
    @ObservedObject var todosViewModel: TodoViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(todosViewModel.todos) { todo in
                        ListRowView(todo: todo)
                    }
                    .onDelete(perform: todosViewModel.deleteItem)
                    .onMove(perform: todosViewModel.moveItem)
                }
            }
            .navigationTitle("To-do")
            .toolbar {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("New To-do")
                }
                .sheet(isPresented: $isPresented) {
                    AddNewTodoView(todosViewModel: todosViewModel, isPresented: $isPresented)
                }
            }
        }
    }
    
    
}
