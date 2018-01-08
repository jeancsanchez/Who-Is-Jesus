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
        UNUserNotificationCenter.current().delegate = self
    }

    @IBAction func btnEnableNotifications(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(
            options:[.alert, .sound, .badge], completionHandler:{ didAllow, error in
                if(didAllow){
                    let _ = VerseService(randomNumber: 0, handler: { (verse) in
                        self.generateNotification(verse: verse)
                    })
                }
        })
    }

    
    /**
     * Generates a new notification from the Verse object.
     * - Parameter verse: The given verse.
     */
    private func generateNotification(verse: Verse){
        let title = verse.book + " " + String(verse.chapterNumber) + " - " + String(verse.verseBeginNumber) + ", " + String(verse.verseEndNumber)
    
        LocalNotificationHelper.sharedInstance().scheduleNotificationWithKey(
            key: "someKey", title: title, message: verse.verse, date: NSDate().addingTimeInterval(5), userInfo: nil
        )
        
        let defaultAction = LocalNotificationHelper.sharedInstance().createUserNotificationActionButton(
            identifier: "defaultAction", title: "Ver mais"
        )
        let actions = [defaultAction]
        
        LocalNotificationHelper.sharedInstance().registerUserNotificationWithActionButtons(actions: actions)

    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
}
