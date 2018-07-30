//
//  ViewController.swift
//  Messaging
//
//  Created by Connie Liu on 7/24/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var senderInput: UITextField!
    @IBOutlet weak var textInput: UITextView!
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBOutlet weak var secondsInput: UIPickerView!
    
    let possibleSeconds : [Int] = Array(01...59)
    
    @IBAction func dateInputSelected(_ sender: UIDatePicker) {
        
    }
    
    @IBOutlet weak var createButton: UIButton!
    @IBAction func createButtonPressed(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        setupViews()
        super.viewDidLoad()
        
        // A CHANGE
        self.secondsInput.dataSource = self //as? UIPickerViewDataSource
        self.secondsInput.delegate = self //as? UIPickerViewDelegate
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        
        
    }

    fileprivate func triggerNotif(at date: Date, for notif: Notif) {
        let uuid = UUID().uuidString
        notif.uuid = uuid
        
        //Create UNMutableNotification
        let content = UNMutableNotificationContent()
        
        content.title = notif.title ?? "Anonymous"
        content.body = notif.body ?? "Message from Anonymous"
        content.badge = 1
        
        //???????? adjust seconds of the date that was given ?????????
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSinceNow, repeats: false)
        
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        //        if identifier == "showQueue" {
        //            print("Transitioning to the Queue List")
        //        }
        switch identifier {
        case "showQueue":
            print("show queue pressed")
            
        case "createNotif":
            
            //Create Notif Object
            let contentBack = CoreDataHelper.newNotif()
            
            contentBack.title = senderInput.text ?? "Anonymous"
            contentBack.body = textInput.text ?? "Message from Anonymous"
            contentBack.triggerTime = dateInput.date
            
            triggerNotif(at: dateInput.date, for: contentBack)
            
            //triggerNotif(at: dateInput.date, for: contentBack)

            let destination = segue.destination as! ListNotificationQueueTableViewController

            destination.notifications.append(contentBack)
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        createButton.layer.cornerRadius = 7
        createButton.layer.masksToBounds = true
        textInput.layer.cornerRadius = 6
        textInput.layer.masksToBounds = true
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return possibleSeconds.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        if possibleSeconds[row] < 10 {
           return String(": 0\(possibleSeconds[row])")
        }
        else {
            return String(": \(possibleSeconds[row])")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //myLabel.text = possibleSeconds[row]
    }


}

