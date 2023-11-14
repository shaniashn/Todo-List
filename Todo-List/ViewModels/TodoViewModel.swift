//
//  TodoViewModel.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var todoModel = TodoModel()
    
    var todos: [Todo] {
        return todoModel.todos
    }
    
    var tasks: [Tasks] {
        return todoModel.tasks.reversed()
    }
    
    func addTodo(todo: Todo) {
        todoModel.addTodos(todo: todo)
    }
    
    func addTask(task: Tasks) {
        todoModel.addTasks(task: task)
    }
    
    func deleteItem(index: IndexSet) {
        todoModel.todos.remove(atOffsets: index)
    }
    
    func updatedTask(theTask: Tasks) { //fungsi ini panggil fungsi yang dari todoModel
        todoModel.updateTask(theTask: theTask)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        todoModel.moveItem(from: from, to: to)
    }
    
    
    
//    func showData() -> Todo {
//        do {
//            var todo = try todos
//            return todo
//        }
//        if todos.isEmpty {
//            return
//        } else {
//            return todos
//        }
//    }
}
