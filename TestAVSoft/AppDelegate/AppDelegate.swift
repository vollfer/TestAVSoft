//
//  AppDelegate.swift
//  TestAVSoft
//
//  Created by Александр  Бровков  on 22.06.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let firstMession = FirstMessionAssemble.assembleModuleNavigation()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = firstMession
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

