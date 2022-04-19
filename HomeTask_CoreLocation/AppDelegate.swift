//
//  AppDelegate.swift
//  HomeTask_CoreLocation
//
//  Created by baxa on 09/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = MapVC(nibName: "MapVC", bundle: nil)
        window = UIWindow()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

    


}

