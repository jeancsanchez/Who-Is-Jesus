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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options:[.alert, .sound, .badge], completionHandler:{ didAllow, error in
                if(didAllow){
                    self.generateNotification(verse: Verse(randomNumber: 0))
                }
            })
    }

    
    func generateNotification(verse: Verse){
        let content = UNMutableNotificationContent()
        let title = verse.book + " " + String(verse.chapterNumber) + " - " + String(verse.verseBeginNumber) + ", " + String(verse.verseEndNumber)
        
        content.title = title
        content.badge = 1
        content.body = verse.verse
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "request", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
