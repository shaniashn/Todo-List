//
//  TodoViewModel.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import Foundation



class TodoViewModel: ObservableObject {
    @Published var todoModel = TodoModel()
    @Published var countTask: Int = 0
    
    var todos: [Todo] {
        return todoModel.todos
    }
    
    var tasks: [Tasks] {
        return todoModel.tasks.reversed()
    }
    
    init() {
        countTheTask()
        
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
        //MARK: fungsi 
//        countTheTask()
//        print("dalam fungsi updatedtask", countTask)
        
//        countTheTasks(pos: theTask)
        
    }
    
    func moveItem(from: IndexSet, to: Int) {
        todoModel.moveItem(from: from, to: to)
    }
    
    func countTheTask(){
        countTask = tasks.filter { $0.isCompleted == true }.count
        print("dalam fungsi count, muncul karena di dalam fungsi countTheTask() yg di .init() TodoViewModel", countTask)
    }
    
    func countTheTasks(pos: Tasks){
//        todoModel.countCompleteTask(id: todos[pos].tasks)
//        todoModel.countCompleteTaskk(taks: tasks[pos])
//        countTask = todoModel.countCompleteTaskk(taks: pos)
    }
    
}
