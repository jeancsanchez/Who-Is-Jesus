//
//  ViewController.swift
//  WhoIsJesus
//
//  Created by Jean  Carlos on 30/12/17.
//  Copyright © 2017 Jean  Carlos. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBAction func btnNotification(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Hello world"
        content.subtitle = "Hello world subtitle"
        content.badge = 1
        content.body = "Hello world body"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "request", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options:[.alert, .sound, .badge], completionHandler:{ didAllow, error in
                if(didAllow){
                    
                }
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

