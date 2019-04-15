//
//  ViewController.swift
//  Data Persistence
//
//  Created by Marco Marruccelli on 07/04/2019.
//  Copyright © 2019 Marco Marruccelli. All rights reserved.
//

import UIKit

class ToDoList: UITableViewController {

    var topicArray = [Item]() //["Grocery List", "Academy Tasks" , "Daily Achievements"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Grocery List"
        topicArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Academy Tasks"
        topicArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Daily Achievements"
        topicArray.append(newItem3)
        
        if let dataOfTheUser = defaults.array(forKey: "ToDoListArray") as? [Item] {
            topicArray = dataOfTheUser
        }
        // Do any additional setup after loading the view.

    // Mark - Datasource methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicArray.count
        
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        let item = topicArray[indexPath.row]
        cell.textLabel?.text = item.title
        
//Ternary operator
//value = condition ? ValueIfTrue : ValueIfFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
      //cell.accessoryType = item.done ? .checkmark : .none
        
//the ternary operator substitutes this.
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    
    // Mark - Delegate methods
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (topicArray[indexPath.row])
        
        topicArray[indexPath.row].done = !topicArray[indexPath.row].done //this method sets the opposite of what the "done" property is right now. It replaces all the bunch of dirty code below in just one line.
        
//        if topicArray[indexPath.row].done == false {
//            topicArray[indexPath.row].done = true
//        } else {
//            topicArray[indexPath.row].done = false
//        }
        tableView.reloadData() // it forces the tableview to call the datasource again
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
}
        
        

@IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var userTextField = UITextField()
        
        
        let alert = UIAlertController(title: "Add new topic", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            print ("Add item pressed")
            print (userTextField.text!)
            
            if userTextField.text != nil {
                
                let newItem = Item()
                
                newItem.title = userTextField.text!
                
                self.topicArray.append(newItem)
                
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
    


