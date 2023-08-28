//
//  ListRowView.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 27/08/23.
//

import SwiftUI

struct ListRowView: View {
    @State var todo: Todo
    
    var body: some View {
        VStack {
            Text(todo.title)
            Text("1/\(todo.tasks.count) done")
        }
        .foregroundColor(.blue)
    }
}

//struct ListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowView(todo: <#Todo#>)
//    }
//}
