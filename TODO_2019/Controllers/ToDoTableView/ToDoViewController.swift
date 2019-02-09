//
//  ToDoViewController.swift
//  TODO_2019
//
//  Created by Друмлевич on 08.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
// MARK: - ... @IBOutlet
    
    @IBOutlet weak var saveButtonOutlet: UIBarButtonItem!
    
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var textFieldTitle: UITextField!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var noteTextView: UITextView!
    // MARK: - ... Stored Properties
    var todo: ToDo?
    var indexPath: IndexPath?
    let checkImage = UIImage(named: "check")
    let unCheckImage = UIImage(named: "uncheck")

    var isPickerHidden = true {
        didSet {
            if oldValue != isPickerHidden {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
    }
    
    // MARK: - ... UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        if let todo = todo {
        loadDataToDo(todo)
        } else {
           dueDatePicker.date = Date().addingTimeInterval(24 * 60 * 60)
            self.navigationItem.title = "New To Do"
        }
       
        updateDueDateLabel(date: dueDatePicker.date)
        updateSaveButtonState()
         setCompleteButton()
    }
    
    
    func loadDataToDo(_ todo: ToDo) {
        textFieldTitle.text = todo.title
        completeButton.isSelected = todo.isComplete
        dueDatePicker.date = todo.dueDate
        noteTextView.text = todo.note
        self.navigationItem.title = "Change To Do"
    }
    
    func setCompleteButton()  {
        
        if completeButton.isSelected {
        completeButton.setImage(checkImage, for: UIControl.State.selected)
        } else {
             completeButton.setImage(unCheckImage, for: .normal)
        }
    }

    
    // MARK: - ... Custom Methods
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    func updateSaveButtonState() {
        let text = textFieldTitle.text ?? ""
        saveButtonOutlet.isEnabled = !text.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveSegue" {
            todo = ToDo(title: textFieldTitle.text ?? "", isComplete: completeButton.isSelected, dueDate: dueDatePicker.date, note: noteTextView.text ?? "")
        
        }
    }
    // MARK: - ... @IBAction

    
    @IBAction func dataPickerChangeValue(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
    @IBAction func dateChoiseButton(_ sender: UIButton) {
        isPickerHidden = true
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    @IBAction func completeButton(_ sender: UIButton) {
        completeButton.isSelected.toggle()
        setCompleteButton()
    }
    
    @IBAction func returnTapped(_ sender: UITextField) {
          textFieldTitle.resignFirstResponder()
    }
    
    @IBAction func changeTextinTextField(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
}
