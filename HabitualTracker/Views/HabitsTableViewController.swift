//
//  MainViewController.swift
//  HabitualTracker
//
//  Created by Jackson Ho on 11/25/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    var names: [String] = ["Alan","Adriana", "Anne", "Mitchell", "Dani"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        
    }
    
    // Return the number of the rows for the given section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    // Return the UITableViewCell for teh given indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell"){
            cell = dequeueCell
        }else{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}

extension HabitsTableViewController{
    func setupNavbar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func pressAddHabit(){
        names.insert("Hello World!", at: 0)
        let topIndexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [topIndexPath], with: .automatic)
    }
}
