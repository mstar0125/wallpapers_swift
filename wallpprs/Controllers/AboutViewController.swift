//
//  AboutViewController.swift
//  wallpprs
//
//  Created by Ben Folds on 11/19/15.
//  Copyright (c) 2015 Ben Folds. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let aboutUrl = appDelegate.configDictionary?.valueForKey("ABOUT_URL")
        
        print("About URL = \(aboutUrl)")
        
        let url1 = NSURL (string: "http://www.yahoo.com");
        let requestObj = NSURLRequest(URL: url1!);
        myWebView.loadRequest(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
