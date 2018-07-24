//
//  ViewController.swift
//  Messaging
//
//  Created by Connie Liu on 7/24/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var senderInput: UITextField!
    @IBOutlet weak var textInput: UITextView!
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBAction func dateInputSelected(_ sender: UIDatePicker) {
    }
    @IBOutlet weak var createButton: UIButton!
    

    
    @IBAction func createButtonPressed(_ sender: UIButton) {
//        let content = UNMutableNotificationContent()
//        content.title = "\(senderInput)"
//        content.body = "\(textInput)"
//        content.badge = 1
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    override func viewDidLoad() {
        setupViews()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        //  })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        // nothing yet
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 0.05
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 35
        createButton.layer.cornerRadius = 7
        createButton.layer.masksToBounds = true
        textInput.layer.cornerRadius = 6
        textInput.layer.masksToBounds = true
//        textInput.layer.shadowOffset = CGSize(width: 0, height: 1)
//        textInput.layer.shadowOpacity = 0.1
//        textInput.layer.shadowColor = UIColor.black.cgColor
//        textInput.layer.shadowRadius = 35
    }


}

