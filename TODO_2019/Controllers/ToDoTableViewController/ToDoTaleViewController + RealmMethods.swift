//
//  ToDoTaleViewController + RealmMethods.swift
//  TODO_2019
//
//  Created by Друмлевич on 10.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import Foundation
import RealmSwift

extension ToDoTableViewController {
    
    func writeToDoInRealm(todos: [ToDo]){
        let realm = try! Realm()
        for todo in todos {
            try! realm.write {
                realm.add(todo)
            }
        }
    }
    
    
    func updateToDoInRealm(id: Int, toDo: ToDo){
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                
                let theToDo = realm.objects(ToDo.self).filter("id == \(id)").first
                if let theToDo = theToDo {
                    try! realm.write {
                        theToDo.title = toDo.title
                        theToDo.isComplete = toDo.isComplete
                        theToDo.note = toDo.note
                        theToDo.dueDate = toDo.dueDate
                        
                    }
                }
            }
        }
    }
    
    func deleteFromRealm(id: Int) {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                let theToDo = realm.objects(ToDo.self).filter("id == \(id)").first
                if let theToDo = theToDo{
                    try! realm.write {
                        realm.delete(theToDo)
                    }
                    let theToDos = realm.objects(ToDo.self).filter("id > \(id)")
                    if !theToDos.isEmpty {
                        for toDo in theToDos {
                            try! realm.write {
                                toDo.id -= 1
                            }
                        }
                    }
                }
            }
        }
    }
    
}
