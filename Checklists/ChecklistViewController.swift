//
//  ViewController.swift
//  Checklists
//
//  Created by Alejandro Barranco on 18/05/18.
//  Copyright © 2018 Alejandro Barranco. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel

        if indexPath.row == 0 {
            label.text = "Run a marathon"
        } else {
            label.text = "Sleep"
        }
        
        return cell
    }
}

