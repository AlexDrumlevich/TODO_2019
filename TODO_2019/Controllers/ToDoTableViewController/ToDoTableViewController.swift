//
//  ToDoTableViewController.swift
//  TODO_2019
//
//  Created by Друмлевич on 08.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    // MARK: - ... Stored Properties
    var todos = [ToDo]()
    
  
    // MARK: - ... UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        todos = ToDo.loadToDos()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "changeToDoSegue" {
        
            guard let dvcNavigationVC = segue.destination as? NavidatioViewControllerToDoViewController else {
                print("Error in \(#file.name) in \(#function) at line \(#line): can't become as NavidatioViewControllerToDoViewController")
                fatalError()
            }
            guard let dvcTableVC = dvcNavigationVC.children.first as? ToDoViewController else {
                print("Error in \(#file.name) in \(#function) at line \(#line): can't become as ToDoViewController")
                fatalError()
            }

            guard let indexPath = self.tableView.indexPathForSelectedRow else {
                print("Error in \(#file.name) in \(#function) at line \(#line): can't get indexPath")
                fatalError()
            }
            print(indexPath)
          
            dvcTableVC.todo = todos[indexPath.row]
            dvcTableVC.indexPath = indexPath
            
        }
    }
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "SaveSegue" else { return }
        guard let sourceViewController = unwindSegue.source as? ToDoViewController else {
            print("Error in \(#file.name) in \(#function) at line \(#line): can't become as ToDoViewController")
            fatalError()
            }
        guard let toDo = sourceViewController.todo else {
            print("Error in \(#file.name) in \(#function) at line \(#line): todo from TODOViewController == nil")
            fatalError()
        }
        if let indexPath = sourceViewController.indexPath {
            todos[indexPath.row] = toDo
        } else {
            todos.append(toDo)
        }
tableView.reloadData()
    }
    
}
