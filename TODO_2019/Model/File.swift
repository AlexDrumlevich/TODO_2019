//
//  File.swift
//  TODO_2019
//
//  Created by Друмлевич on 08.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import Foundation
struct ToDo {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var note: String?
    
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
}
