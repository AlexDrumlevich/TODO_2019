//
//  File.swift
//  TODO_2019
//
//  Created by Друмлевич on 08.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class ToDo: Object {
    @objc dynamic var title: String
    @objc dynamic var isComplete: Bool
    @objc dynamic var dueDate: Date
    @objc dynamic var note: String?
    @objc dynamic var id = -1

    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter
    }()
    
    static func loadToDos() -> [ToDo] {
        return defaultToDos()
    }
    
    static func defaultToDos() -> [ToDo] {
        return [
            ToDo(title: "To Do 1", isComplete: false, dueDate: Date(), note: "Note 1"),
            ToDo(title: "To Do 2", isComplete: false, dueDate: Date(), note: "Note 2"),
            ToDo(title: "To Do 3", isComplete: false, dueDate: Date(), note: "Note 3"),
            ToDo(title: "To Do 4", isComplete: false, dueDate: Date(), note: "Note 4"),
        ]
    }
    convenience init(title: String, isComplete: Bool, dueDate: Date, note: String) {
        self.init()
        
        self .title = title
        self .isComplete = isComplete
        self.dueDate = dueDate
        self.note = note
  //    super.init()
       
    }
    
   
    required init() {
        self.title = ""
        self.isComplete = false
        self.dueDate = Date()
        self.note = ""
      super.init()
     //   fatalError("init() has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        self.title = ""
        self.isComplete = false
        self.dueDate = Date()
        self.note = ""
        super.init(realm: realm, schema: schema)
       
  //  fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        self.title = ""
        self.isComplete = false
        self.dueDate = Date()
        self.note = ""
        super.init(value: value, schema: schema)
        //fatalError("init(value:schema:) has not been implemented")
    }
}
