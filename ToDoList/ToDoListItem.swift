//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Roman Fedotov on 18.06.2021.
//

import Foundation
import CoreData

public class ToDoListItem: NSManagedObject, Identifiable {
    @NSManaged public var creation: Date?
    @NSManaged public var name: String?
}

extension ToDoListItem {
    static func getAllToDoListItems() -> NSFetchRequest<ToDoListItem> {
        let request: NSFetchRequest<ToDoListItem> = ToDoListItem.fetchRequest() as! NSFetchRequest<ToDoListItem>
        
        let sortDescription = NSSortDescriptor(key: "creation", ascending: true)
        
        request.sortDescriptors = [sortDescription]
        
        return request
    }
}
