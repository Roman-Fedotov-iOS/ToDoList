//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Roman Fedotov on 18.06.2021.
//

import SwiftUI

struct ToDoListItemView: View {
    var name = ""
    var creation = ""
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(name)
                    .font(.headline)
                Text(creation)
                    .font(.caption)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(name: "My To Do", creation: "Today")
    }
}
