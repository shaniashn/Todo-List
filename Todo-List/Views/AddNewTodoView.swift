//
//  AddNewTodoView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import SwiftUI

struct AddNewTodoView: View {
    @ObservedObject var todosViewModel: TodoViewModel
    
    @Binding var isPresented: Bool
    
    @State var index: Int = 0
    @State var inputTitle: String = ""
    @State var inputTask: String = ""
    @State var isCompleted: Bool = false
    
//    @State var showAlert: Bool = false
//    @State var alertTitle: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Title")
                        .font(.system(size: 28, weight: .regular))
                    TextField("Input title", text: $inputTitle)
                }
                .padding()
                
                VStack {
                    Text("List of task")
                            .font(.system(size: 18, weight: .regular))
                    HStack {
                        TextField("Input task", text: $inputTask)
                        Button {
                            todosViewModel.addTask(task: Tasks(id: UUID(), task: inputTask, isCompleted: isCompleted))
                            inputTask = ""
                            index += 1
                        } label: {
                            Image(systemName: "plus")
                        }
//                        .alert("asasa", isPresented: $showAlert, actions: getAlert)
                    }
                    VStack {
                        List {
                            ForEach(todosViewModel.tasks) { task in
                                HStack {
                                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                                    Text(task.task)
                                }
                                .onTapGesture {
                                    todosViewModel.updatedTask(theTask: task)
                                }
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Add New")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
//                        if checkText() {
                        todosViewModel.addTodo(todo: Todo(id: UUID().uuidString, title: inputTitle, isCompleted: false, tasks: todosViewModel.tasks))
                            print(todosViewModel.todos)
                            isPresented.toggle()
//                        } 
                    }
                }
            }
            
        }
        
    }
    
//    func checkText() -> Bool {
//        if inputTitle.count < 3 {
//            alertTitle = "Minimal 3 huruf"
//            showAlert.toggle()
//            return false
//        }
//        return true
//    }
    
//    func getAlert() -> Alert {
//        return Alert(title: Text(alertTitle))
//    }
}

//struct AddNewTodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewTodoView()
//    }
//}
