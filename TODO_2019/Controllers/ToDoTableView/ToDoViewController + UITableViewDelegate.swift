//
//  ToDoViewController + UITableViewDelegate.swift
//  TODO_2019
//
//  Created by Друмлевич on 08.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit


extension ToDoViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalHeight = CGFloat(44)
        let largeHeight = CGFloat(200)
        
        switch indexPath {
        case IndexPath(row: 0, section: 1):
            return isPickerHidden ? normalHeight : 0
        case IndexPath(row: 1, section: 1):
            return isPickerHidden ? 0 : largeHeight
        case IndexPath(row: 0, section: 2):
            return self.view.frame.height / 4
        default:
            return normalHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case IndexPath(row: 0, section: 1):
            isPickerHidden = false
        default:
            isPickerHidden = true
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
