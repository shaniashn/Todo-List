//
//  ContentView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var todosViewModel = TodoViewModel()
    
    var body: some View {
        TodoListView(todosViewModel: todosViewModel)
        
    }
}
