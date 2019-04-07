//
//  ViewController.swift
//  Data Persistence
//
//  Created by Marco Marruccelli on 07/04/2019.
//  Copyright © 2019 Marco Marruccelli. All rights reserved.
//

import UIKit

class ToDoList: UITableViewController {

    
    let topicArray = ["Grocery List", "Academy Tasks" , "Daily Achievements"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Mark - Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = topicArray[indexPath.row]
        
        return cell
    }
    
    
    // Mark - Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (topicArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    


    }
    


