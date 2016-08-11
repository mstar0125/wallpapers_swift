//
//  MainViewController.swift
//  wallpprs
//
//  Created by Ben Folds on 11/19/15.
//  Copyright (c) 2015 Ben Folds. All rights reserved.
//

import UIKit
import ImageLoader

class MainViewController: UIViewController, UIScrollViewDelegate, ServiceManagerDelegate {

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let serviceManager = ServiceManager()
    
    
    var currentIndex = 0
    
    var photoArray: [String] = []
    
    var currentCategory:Category?
    var imageCount:Int = 0
    
    @IBOutlet weak var slideshowView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if currentCategory != nil{
            self.loadCategoryWallpapers(currentCategory!)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onGotoAboutPage() {
        let aboutVC: AboutViewController = self.storyboard?.instantiateViewControllerWithIdentifier("aboutVC") as! AboutViewController
        self.navigationController?.pushViewController(aboutVC, animated: true)
    }
    
    func loadCategoryWallpapers(category:Category){
        Utility.sharedInstance.showMessage(self.view, text: "Loading...")
        serviceManager.delegate = self
        serviceManager.getCategoryWallpapers(category)
    }
    
    // MARK: - API Delegation
    func getReceivedData(mode: Int, data: AnyObject?) {
        Utility.sharedInstance.hideMessage(self.view)
        
        if (mode == Modes.GETCATEGORYWALLPAPERS){
            
            currentCategory = data as? Category
            imageCount = (currentCategory?.wallpapers.count)!
            
            slideshowView.pagingEnabled = true
            slideshowView.contentSize = CGSizeMake(slideshowView.frame.width * CGFloat(imageCount), slideshowView.frame.height)
            slideshowView.showsHorizontalScrollIndicator = false
            slideshowView.showsVerticalScrollIndicator = false
            slideshowView.scrollsToTop = false
            slideshowView.delegate = self
            
            if imageCount > 0{
                if currentIndex > 0{
                    self.loadScrollViewWithPage(currentIndex - 1)
                }
                self.loadScrollViewWithPage(currentIndex)
                
                if currentIndex < imageCount - 1 {
                    self.loadScrollViewWithPage(currentIndex + 1)
                }
                
                var frame = slideshowView.frame
                frame.origin.x = frame.size.width * CGFloat(currentIndex)
                frame.origin.y = 0
                slideshowView .scrollRectToVisible(frame, animated: true)
            }
        }
    }
    
    func loadScrollViewWithPage(page:Int){
        if page < 0{
            return
        }
        if page >= imageCount{
            return
        }
        let wallpaper = currentCategory?.wallpapers[(currentCategory?.wallpapers.startIndex.advancedBy(page))!]
        let thumbnailUrl = "http:" + wallpaper!.thumbnail
        print("\(thumbnailUrl)")
        
        var frame = slideshowView.frame
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0
        
        let imageView = UIImageView(frame: frame)
        
        imageView.image = UIImage(named: "1.jpg")
        /*
        ImageLoader.load(thumbnailUrl).completionHandler { (url, image, error, cache) -> Void in
            imageView.image = image
        }
        */
        slideshowView.addSubview(imageView)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = slideshowView.frame.width
        let page: Int = Int(floor((slideshowView.contentOffset.x - pageWidth / 2) / pageWidth)) + 1
        currentIndex = page
        
        self.loadScrollViewWithPage(page-1)
        self.loadScrollViewWithPage(page)
        self.loadScrollViewWithPage(page+1)
    }
}
