//
//  NotificationDelegate.swift
//  WhoIsJesus
//
//  Created by Jean  Carlos on 09/01/18.
//  Copyright © 2018 Jean  Carlos. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

class NotificationDelegate : NSObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Play sound and show alert to the user
        completionHandler([.alert,.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // Determine the user action
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
            
        case UNNotificationDefaultActionIdentifier:
            let url = (response.notification.request.content.userInfo["url"] as? String)?.lowercased()
            
            // Navigate
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "detailViewController") as! UINavigationController
            let view = controller.topViewController as! DetailViewController
            view.url = url!
            
            UIApplication.shared.keyWindow?.rootViewController?.present(view, animated: true, completion: nil)
            
        default:
            print("Unknown action")
        }
        completionHandler()
    }
}
