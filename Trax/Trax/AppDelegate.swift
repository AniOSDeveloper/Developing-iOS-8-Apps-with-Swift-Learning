//
//  AppDelegate.swift
//  Trax
//
//  Created by WangDa on 12/17/15.
//  Copyright © 2015 dawang. All rights reserved.
//

import UIKit

struct GPXURL {
    static let Notification = "GPXURL Radio Station"
    static let Key = "GPXURL URL Key"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        let center = NSNotificationCenter.defaultCenter()
        let notification = NSNotification(name: GPXURL.Notification, object: self, userInfo: [GPXURL.Key:url])
        print("url = \(url)")
        center.postNotification(notification)
        return true
    }
    
}

