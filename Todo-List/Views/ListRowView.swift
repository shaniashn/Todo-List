//
//  ListRowView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 27/08/23.
//

import SwiftUI

struct ListRowView: View {
    var todo: Todo
    
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
            VStack(alignment: .leading){
                Text(todo.title)
                Text("1/\(todo.tasks.count) done")
            }
            .padding(.horizontal, 5)
            NavigationLink {
                TodoListDetails(todo: todo)
            } label: {
                Image("chevron.right")
            }

        }
        .foregroundColor(.blue)
    }
}
