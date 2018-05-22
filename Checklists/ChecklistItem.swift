//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Alejandro Barranco on 21/05/18.
//  Copyright © 2018 Alejandro Barranco. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
    override var description: String {
        return "Name: \(text) checked:\(checked)"
    }
}
