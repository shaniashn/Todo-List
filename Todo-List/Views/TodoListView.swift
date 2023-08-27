//
//  TodoListView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import SwiftUI

struct TodoListView: View {
    @State var isPresented = false
    @StateObject var todosViewModel = TodoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(todosViewModel.todos) { todo in
                        VStack {
                            Text(todo.title)
                            Text("1/\(todo.tasks.count) done")
                        }
                    }
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
                    AddNewTodoView(isPresented: $isPresented)
                }
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
