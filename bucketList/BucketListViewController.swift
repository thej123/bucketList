//
//  ViewController.swift
//  bucketList
//
//  Created by Thej on 9/11/17.
//  Copyright © 2017 Thej. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    var items = ["Go to the moon", "Eat a candy bar", "Swim in the Amazon", "Ride a motorbike in Tokyo"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    
    }
    
    // override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    print ("Selected")
    // }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "EditItemSegue", sender: sender)
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*if segue.identifier == "AddItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
        } else if segue.identifier == "EditItemSegue" {
            
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath

        }*/
        
        if let senderExist = sender {
            print(senderExist)
            print(type(of: senderExist))
            if type(of: senderExist) == NSIndexPath.self {
                let navigationController = segue.destination as! UINavigationController
                let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
                addItemTableViewController.delegate = self
            
                let indexPath = sender as! NSIndexPath
                let item = items[indexPath.row]
                addItemTableViewController.item = item
                addItemTableViewController.indexPath = indexPath
            } else {
                let navigationController = segue.destination as! UINavigationController
                let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
                addItemTableViewController.delegate = self
            }
        }
        
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        print("I'm the hidden controller, BUT I am responding to the cancel button press on the top view controller.")
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath {
            items[ip.row] = text
        } else {
            items.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
}
