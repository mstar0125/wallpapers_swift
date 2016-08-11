//
//  AppDelegate.swift
//  wallpprs
//
//  Created by Ben Folds on 11/18/15.
//  Copyright (c) 2015 Ben Folds. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var configDictionary: NSDictionary?
    var theMenuContainerViewController: MFSideMenuContainerViewController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        getConfigurationData()
        initMenu()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Initialize
    
    func getConfigurationData() {
        if let path = NSBundle.mainBundle().pathForResource("configuration", ofType: "plist") {
            configDictionary = NSDictionary(contentsOfFile: path)
        }
    }
    
    func initMenu(){
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sideVC = storyboard.instantiateViewControllerWithIdentifier("sidemenuVC") as UIViewController
        let containerVC = storyboard.instantiateViewControllerWithIdentifier("containerVC") as! ContainerViewController
        
        let mainVC = storyboard.instantiateViewControllerWithIdentifier("mainVC") as! MainViewController
        let categoryVC = storyboard.instantiateViewControllerWithIdentifier("categoryVC") as! CategoryViewController
        
        containerVC.mainViewController = mainVC
        containerVC.categoryViewController = categoryVC
        
        theMenuContainerViewController = MFSideMenuContainerViewController();
        theMenuContainerViewController?.panMode = MFSideMenuPanModeNone;
        theMenuContainerViewController?.leftMenuViewController = sideVC
        theMenuContainerViewController?.centerViewController = containerVC;
    }
}

