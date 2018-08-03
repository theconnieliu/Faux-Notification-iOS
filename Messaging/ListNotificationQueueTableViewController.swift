//
//  ListNotificationQueueTableViewController.swift
//  Messaging
//
//  Created by Connie Liu on 7/25/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData

class ListNotificationQueueTableViewController: UITableViewController {
   
    // MAKE INTRODUCTION / EXPLANATION PAGE
    // LOOK INTO RESOURCES PROVIDED BY YVES
    // CUSTOMIZE NAVIGATION BAR
    // UPDATE TABLE VIEW CELL THAT THE NOTIFICATION HAS BEEN DELIVERED
    // MAKE TEXT OPTIONALS
    
    var notifications = [Notif]() {
        didSet {
            notifications = notifications.sorted(by: {
                $0.triggerTime?.compare($1.triggerTime!) == .orderedAscending
            })
            tableView.reloadData()
        }
    }//a measure of just how badly one has to try to seem nonchalant.
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        notifications = CoreDataHelper.retrieveNotifs()
        
        //ListNotificationQueueTableViewController.

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       // return 0
  //  }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notifications.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotificationQueueTableViewCell", for: indexPath) as! ListNotificationQueueTableViewCell
        
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100.0;
        
        let notif = notifications[indexPath.row]

        cell.senderQueueLabel.text = notif.title
        cell.contentQueueLabel.text = notif.body
        cell.deliveryTimeLabel.text = notif.triggerTime?.toString(dateFormat: "MM-dd-yyyy HH:mm:ss")
        
        cell.contentQueueLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.contentQueueLabel.numberOfLines = 0
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    // Delete Notification in TableView
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notifications[indexPath.row].uuid!])
            
            CoreDataHelper.delete(notif: notifications[indexPath.item])
            notifications.remove(at: indexPath.row)
            tableView.reloadData()
            
            
// currently removes notification, but not cell in TableViewCell
        }
        
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
