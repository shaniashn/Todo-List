//
//  TodoListDetails.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 24/10/23.
//

import SwiftUI

struct TodoListDetails: View {
    var todo: Todo
    
    var body: some View {
        VStack {
            Text(todo.title)
                .foregroundStyle(.blue)
            List {
                ForEach(todo.tasks) { task in
                    Text(task.task)
                }
            }
        }
    }
}
