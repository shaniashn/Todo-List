//
//  ContentView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var todosViewModel = TodoViewModel()
    
//    @Binding var showAlert: Bool // = false
//    @Binding var alertTitle: String // = ""
    
    var body: some View {
        TodoListView(todosViewModel: todosViewModel)
//        TodoListView(alertTitle: <#T##Binding<String>#>, showAlert: <#T##Binding<Bool>#>, todosViewModel: <#T##TodoViewModel#>)
//        TodoListView(alertTitle: $alertTitle, showAlert: $showAlert, todosViewModel: todosViewModel)
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
