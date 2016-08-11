//
//  SideMenuViewController.swift
//  wallpprs
//
//  Created by Ben Folds on 11/19/15.
//  Copyright (c) 2015 Ben Folds. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var menuTitles: [String] = ["RECENT"]
    var isExpanded: Bool = false
    var total = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerClass(GHMenuCell.self, forCellReuseIdentifier: "GHMenuCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (WallpprsManager.sharedInstance.categories?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:GHMenuCell = self.tableView.dequeueReusableCellWithIdentifier("GHMenuCell") as! GHMenuCell
        
        /*
        var isChild = false
        
        if isExpanded{
            if indexPath.row > 1 && indexPath.row < 2 + (WallpprsManager.sharedInstance.categories?.count)!{
                isChild = true
            }
        }
        
        if isChild{
            let category = WallpprsManager.sharedInstance.categories![indexPath.row - 2]
            cell.textLabel?.text = category.title
            cell.textLabel?.font = UIFont(name:"Helvetica", size: UIFont.systemFontSize())
        }else{
            cell.textLabel?.text = self.menuTitles[self.getParentPosition(indexPath.row)]
            cell.textLabel?.font = UIFont(name:"Helvetica-Bold", size: UIFont.systemFontSize() * 1.2)

        }
*/
        let category = WallpprsManager.sharedInstance.categories![indexPath.row]
        cell.textLabel?.text = category.title
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let theContainerController: ContainerViewController  = self.menuContainerViewController.centerViewController as! ContainerViewController
        
        let category = WallpprsManager.sharedInstance.categories![indexPath.row]
        
        theContainerController.showMainViewController(category)
        self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
        
        /*
        var isChild = false
        
        if isExpanded{
            if indexPath.row > 1 && indexPath.row < 2 + (WallpprsManager.sharedInstance.categories?.count)!{
                isChild = true
            }
        }
        
        if isChild{
            self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
        }else{
            let position = self.getParentPosition(indexPath.row)
            switch (position) {
            case 0:
                theContainerController.showMainViewController()
                self.menuContainerViewController.setMenuState(MFSideMenuStateClosed, completion: nil)
                break;
            case 1:
                //theContainerController.showCategoryViewController()
                
                self.tableView.beginUpdates()
                
                if isExpanded{
                    self.collapseCategories()
                }else{
                    self.expandCategories()
                }
                
                isExpanded = !isExpanded;
                
                self.tableView.endUpdates()
                
                break;
            case 2:
                
                break;
            default:
                break;
            }
        }
        */
    }
    
    private func expandCategories() {
        
        var indexPaths = [NSIndexPath]()
        
        let categories = WallpprsManager.sharedInstance.categories
        
        var insertPos = 2
        for (var i = 0; i < categories!.count; i++) {
            indexPaths.append(NSIndexPath(forRow: insertPos++, inSection: 0))
        }
        
        self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Fade)
        self.total += categories!.count
    }
    
    private func collapseCategories() {
        
        var indexPaths = [NSIndexPath]()
        let categories = WallpprsManager.sharedInstance.categories
        
        for (var i = 2; i <= 1 + categories!.count; i++ ){
            indexPaths.append(NSIndexPath(forRow: i, inSection: 0))
        }
        
        self.tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Fade)
        self.total  -= categories!.count
    }
    
    private func getParentPosition(position: Int) -> Int {
        if position < 2{
            return position
        }else if isExpanded{
            return position - (WallpprsManager.sharedInstance.categories?.count)!
        }else{
            return position
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
