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


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate{
    
    let possibleSeconds : [Int] = Array(01...59)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var senderInput: UITextField!
    @IBOutlet weak var textInput: UITextView!
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBOutlet weak var secondsInput: UIPickerView!
    
    // Updates the DatePicker Date with the Seconds value from the secondsInput PickerView
    var selectedSecond: Int!{
        didSet{
            let calendar = Calendar.current
            let date =   calendar.date(bySetting: .second, value: selectedSecond, of: dateInput.date)
            dateInput.date = date!
        }
    }
    
    @IBAction func dateInputSelected(_ sender: UIDatePicker) {
    }
    @IBOutlet weak var createButton: UIButton!
    @IBAction func createButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        setupViews()
        
        //sets minimum date to current date and time
//        dateInput.minimumDate = Date()
        senderInput.delegate = self
        textInput.delegate = self
        
        super.viewDidLoad()
        
        self.secondsInput.dataSource = self
        self.secondsInput.delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dateInput.minimumDate = Date()
    }

    fileprivate func triggerNotif(at date: Date, for notif: Notif) {
        let uuid = UUID().uuidString
        notif.uuid = uuid
        
        //Create UNMutableNotification
        let content = UNMutableNotificationContent()
        
        content.title = notif.title ?? "Anonymous"
        content.body = notif.body ?? "Message from Anonymous"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSinceNow, repeats: false)
        
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "showQueue":
            print("show queue pressed")
            
        case "createNotif":
            
            //Create Notif Object
            
            //Checks if input date is after current date
            if dateInput.date > Date() {
                
                let contentBack = CoreDataHelper.newNotif()
                
                contentBack.title = senderInput.text ?? "Anonymous"
                contentBack.body = textInput.text ?? "Message from Anonymous"
                contentBack.triggerTime = dateInput.date
                
                triggerNotif(at: dateInput.date, for: contentBack)
                
                let destination = segue.destination as! ListNotificationQueueTableViewController
                
                destination.notifications.append(contentBack)
            } else {
                createAlert(title: "Hello!", message: "Please select a valid delivery time. (Make sure it's not in the past!)")
            }

        default:
            print("unexpected segue identifier")
        }
    }
    
    func createAlert (title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"Okay", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Okay")
        }))
        self.present(alert, animated: true, completion: nil)
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
        selectedSecond = possibleSeconds[row]
    }
    
    // Dismisses Keyboard when View outside input fields is tapped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
    
    
    
}

