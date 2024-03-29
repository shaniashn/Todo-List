//
//  Todo.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import Foundation

//todo model
struct Todo: Identifiable {
    var id: String
    var title: String
    var isCompleted: Bool
    var tasks: [Tasks]
    
    var countFinish: Int {
        print("ini finish")
        return tasks.filter { $0.isCompleted }.count
    }
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, tasks: [Tasks]) {
        self.id = id
        self.title = title
        self.tasks = tasks
        self.isCompleted = isCompleted
    }
    
    
}

struct Tasks: Identifiable {
    var id: UUID
    var task: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), task: String, isCompleted: Bool) {
        self.id = id
        self.task = task
        self.isCompleted = isCompleted
    }
    
    func updateItem() -> Tasks {
        return Tasks(task: task, isCompleted: !isCompleted)
    }
    
    
}

struct TodoModel {
    var todos: [Todo] = []
    var tasks: [Tasks] = []
    var counted: Int {
        let x = tasks.filter { $0.isCompleted == true }.count
        print("di todo model")
        print(x)
        return x
    }
    
    mutating func addTodos(todo: Todo) {
        todos.append(todo)
        tasks.removeAll()
    }
    
    mutating func addTasks(task: Tasks) {
        tasks.append(task)
    }
    
    mutating func moveItem(from: IndexSet, to: Int) {
        todos.move(fromOffsets: from, toOffset: to)
    }
    
    mutating func updateTask(theTask: Tasks) {
        if let index = tasks.firstIndex(where: { $0.id == theTask.id }) {
            tasks[index] = theTask.updateItem()
        }
    }
    
//    mutating func countCompleteTask(id: Int) -> Int {
//        
//        let check = tasks.filter { $0.isCompleted == true }.count
//        return check
//    }
//    
//    mutating func countCompleteTaskk(taks: Tasks) -> Int {
//        let x = tasks.filter { $0.isCompleted == true }.count
//        return x
//    }
    
}
