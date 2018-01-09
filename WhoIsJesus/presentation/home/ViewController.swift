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
        
        let userInfo = ["url" : "https://www.bibliaonline.com.br/acf/\(verse.book)/\(verse.chapterNumber)/\(verse.verseBeginNumber)+\(verse.verseEndNumber)"]
        
        LocalNotificationHelper.sharedInstance()
                .scheduleNotificationWithKey(
                        key: "default",
                        title: title,
                        message: verse.verse,
                        seconds: 5,
                        userInfo: userInfo as [NSObject : AnyObject]?
        )
    }
}
