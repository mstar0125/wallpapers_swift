//
//  IntroViewController.swift
//  wallpprs
//
//  Created by Ben Folds on 11/18/15.
//  Copyright (c) 2015 Ben Folds. All rights reserved.
//

import UIKit


class IntroViewController: UIViewController, ServiceManagerDelegate {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let serviceManager = ServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utility.sharedInstance.showMessage(self.view, text: "Loading...")
        serviceManager.delegate = self
        serviceManager.getCategories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func onGoNext(sender: UIButton) {
        
        if WallpprsManager.sharedInstance.categories?.count > 0{
            let contianerVC = (appDelegate.theMenuContainerViewController?.centerViewController)! as! ContainerViewController
            contianerVC.mainViewController?.currentCategory = WallpprsManager.sharedInstance.categories![0]
        }
        self.navigationController?.pushViewController(appDelegate.theMenuContainerViewController!, animated: true)
    }
    
    // MARK: - API Delegation
    func getReceivedData(mode: Int, data: AnyObject?) {
        Utility.sharedInstance.hideMessage(self.view)
        
        if (mode == Modes.GETCATEGORIES){
            print("categories: \(WallpprsManager.sharedInstance.categories)")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
