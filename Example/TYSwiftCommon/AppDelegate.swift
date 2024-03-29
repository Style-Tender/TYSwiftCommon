//
//  AppDelegate.swift
//  TYSwiftCommon
//
//  Created by 785072254@qq.com on 12/15/2020.
//  Copyright (c) 2020 785072254@qq.com. All rights reserved.
//

import UIKit
import TYSwiftCommon

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        TYCommon.ty_init(enable: true)
        //导航栏
        TYNavigationBarManager.ty_default_navigationbar_shadow_image_hidden = true
        TYNavigationBarManager.ty_default_navigationbar_title_text_color = .black
        TYNavigationBarManager.ty_default_navigationbar_background_color = .white
        TYNavigationBarManager.ty_classPrefix = "TY"
        
        let nav = UINavigationController.init(rootViewController: TYViewController.init())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        TYHttpHelper.GET(url: "https://www.baidu.com", parameters: ["1":"1","2":"2"], headers: ["3":"3","4":"4"], success: nil, failure: nil, complete: nil)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

