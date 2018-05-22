//
//  ViewController.swift
//  Checklists
//
//  Created by Alejandro Barranco on 18/05/18.
//  Copyright © 2018 Alejandro Barranco. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItem]
    var titles = ["AAAA", "BB", "CCC", "DDD"]
    var getRandomTitle: String {
        let randomNumber = arc4random_uniform(UInt32(titles.count))
        return titles[Int(randomNumber)]
    }
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        let row0Item = ChecklistItem()
        row0Item.checked = false
        row0Item.text = "Walk the dog"
        items.append(row0Item)
        
        let row1Item = ChecklistItem()
        row1Item.checked = false
        row1Item.text = "Brush my teeth"
        items.append(row1Item)
        
        let row2Item = ChecklistItem()
        row2Item.checked = false
        row2Item.text = "Soccer practice"
        items.append(row2Item)
        
        let row3Item = ChecklistItem()
        row3Item.checked = false
        row3Item.text = "Learn iOS development"
        items.append(row3Item)
        
        let row4Item = ChecklistItem()
        row4Item.checked = false
        row4Item.text = "Eat ice cream"
        items.append(row4Item)
        
        let row5Item = ChecklistItem()
        row5Item.checked = false
        row5Item.text = "Bla bla bla"
        items.append(row5Item)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        configureText(for: cell, with: items[indexPath.row])
        configureCheckmark(for: cell, with: items[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            configureCheckmark(for: cell, with: items[indexPath.row])
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        (cell.viewWithTag(1000) as! UILabel).text = item.text
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        item.toggleChecked()
//        item.checked = !item.checked
    }
    
    @IBAction func barButtonAddItemPressed(_ sender: UIBarButtonItem) {
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = getRandomTitle
        item.checked = true
        
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
}









