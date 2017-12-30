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

