//
//  ListRowView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 27/08/23.
//

import SwiftUI
//  per row todo
struct ListRowView: View {
    @ObservedObject var todosViewModel: TodoViewModel
    var todo: Todo
    
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
            VStack(alignment: .leading){
                Text(todo.title)
                Text("\(todo.countFinish)")
//                Text("\(todosViewModel.todoModel.counted)")
            }
            .padding(.horizontal, 5)
            .onAppear {
                print("di view judul")
            }
            NavigationLink {
                TodoListDetails(todo: todo)
            } label: {
                Image(systemName: "chevron.right")
            }

        }
        .foregroundColor(.blue)
    }
}
