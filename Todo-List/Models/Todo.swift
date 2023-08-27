//
//  Todo.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import Foundation

struct Todo: Identifiable {
    var id: UUID
    var title: String
    var tasks: [Tasks]
}

struct Tasks: Identifiable {
    var id: Int
    var task: String
}

struct TodoModel {
    var todos: [Todo] = []
    var tasks: [Tasks] = []
    
    mutating func addTodos(todo: Todo) {
        todos.append(todo)
    }
    
    mutating func addTasks(task: Tasks) {
        tasks.append(task)
    }
    
}
