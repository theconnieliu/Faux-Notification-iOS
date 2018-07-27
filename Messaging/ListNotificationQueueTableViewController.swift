//
//  ListNotificationQueueTableViewController.swift
//  Messaging
//
//  Created by Connie Liu on 7/25/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit
import UserNotifications

class ListNotificationQueueTableViewController: UITableViewController {
    
    
    
    var notifications = [UNMutableNotificationContent]() {
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        //return notifications.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotificationQueueTableViewCell", for: indexPath) as! ListNotificationQueueTableViewCell
        
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100.0;
        
        let notif = notifications[indexPath.row]

        cell.senderQueueLabel.text = notif.title
        cell.contentQueueLabel.text = notif.body
        cell.deliveryTimeLabel.text = "Time"
        
        cell.contentQueueLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.contentQueueLabel.numberOfLines = 0

        return cell
    }
    
    // DELETE NOTIFICATION
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//
//        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
////
////            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: notif.uuid)
//
//            self.notifications.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            print(self.notifications)
//        }
//
    
        
        
        
        
        
        
//        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
//            // share item at indexPath
//            print("I want to share: \(self.notifications[indexPath.row])")
//        }
        
        //share.backgroundColor = UIColor.lightGray
        
      //  return [delete/*, share*/]
        
  //  }
    
    //MESSING AROUND OMG HELP
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let identifier = segue.identifier else { return }
//
////        if identifier == "showQueue" {
////            print("Transitioning to the Queue List")
////        }
//        switch identifier {
//        case "showQueue":
//            print("show queue pressed")
//
//        case "createNotif":
//            //print("create Notification pressed")
//            let content = UNMutableNotificationContent()
//
//            content.title = senderInput.text ?? "Anonymous"
//            content.body = textInput.text ?? "Message from Anonymous"
//            content.badge = 1
//
//            let uuid = UUID().uuidString
//
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: /*dateInput.date.timeIntervalSinceNow*/ 5, repeats: false)
//
//            let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
//
//            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//
//        default:
//            print("unexpected segue identifier")
//        }
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
