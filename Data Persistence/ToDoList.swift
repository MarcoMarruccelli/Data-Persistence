//
//  ViewController.swift
//  Data Persistence
//
//  Created by Marco Marruccelli on 07/04/2019.
//  Copyright © 2019 Marco Marruccelli. All rights reserved.
//

import UIKit

class ToDoList: UITableViewController {

    var topicArray = ["Grocery List", "Academy Tasks" , "Daily Achievements"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let dataOfTheUser = defaults.array(forKey: "ToDoListArray") as? [String] {
            topicArray = dataOfTheUser
        }
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
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var userTextField = UITextField()
        
        
        let alert = UIAlertController(title: "Add new topic", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            print ("Add item pressed")
            print (userTextField.text!)
            
            if userTextField.text != nil {
                self.topicArray.append(userTextField.text!)
                self.defaults.set(self.topicArray, forKey: "ToDoListArray")
                self.tableView.reloadData()
            } else {
                return
            }
            
            
            
           
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            userTextField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    }
    


