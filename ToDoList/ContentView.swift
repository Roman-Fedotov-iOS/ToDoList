//
//  ContentView.swift
//  ToDoList
//
//  Created by Roman Fedotov on 18.06.2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var mangedObjectContext
    @FetchRequest(fetchRequest: ToDoListItem.getAllToDoListItems()) var toDoListItems: FetchedResults<ToDoListItem>
    @State private var newToDoItem: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("New Task")) {
                    HStack {
                        TextField("New Item", text: self.$newToDoItem)
                        Button (action: {
                            let toDoItem = ToDoListItem(context: self.mangedObjectContext)
                            toDoItem.name = self.newToDoItem
                            toDoItem.creation = Date().addingTimeInterval(10800)
                            do {
                                try self.mangedObjectContext.save()
                            }catch {
                                print(error)
                            }
                            self.newToDoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To Do`s")) {
                    ForEach(self.toDoListItems) {toDoItem in
                        ToDoListItemView(name: toDoItem.name!, creation: "\(toDoItem.creation!)")
                    }.onDelete(perform: { indexSet in
                        let deletItem = self.toDoListItems[indexSet.first!]
                        self.mangedObjectContext.delete(deletItem)
                        do {
                            try self.mangedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    })
                }
            }
            .navigationTitle(Text("To Do List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
