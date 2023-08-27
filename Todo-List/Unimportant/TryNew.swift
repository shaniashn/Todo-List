//
//  TryNew.swift
//  Todo-List
//
//  Created by Sha Nia Siahaan on 23/08/23.
//

import SwiftUI

struct TryNew: View {
    @State var inputText: String = ""
    var body: some View {
        HStack {
            TextField("Input task", text: $inputText)
        }
    }
}

struct TryNew_Previews: PreviewProvider {
    static var previews: some View {
        TryNew()
    }
}
