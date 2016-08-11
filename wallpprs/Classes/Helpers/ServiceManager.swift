//
//  ServiceManager.swift
//  wallpprs
//
//  Created by Ben Folds on 11/27/15.
//  Copyright (c) 2015 Ben Folds. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol ServiceManagerDelegate{
    func getReceivedData(mode:Int, data: AnyObject?)
}

class ServiceManager: NSObject {
    
    var delegate:ServiceManagerDelegate?
    
    func getCategories(){
        Alamofire.request(.GET, URLs.GETCATEGORIES)
            .responseJSON { response in
                
                switch response.result {
                case .Success(let data):
                    
                    let json = JSON(data)
                    let categoryArray = json["categories"].array
                    
                    var categories = [Category]()
                    
                    for data in categoryArray!{
                        let title = data["title"].stringValue;
                        let url = data["url"].stringValue;
                        
                        let category = Category(title: title, url: url);
                        categories.append(category);
                    }
                    WallpprsManager.sharedInstance.categories = categories
                    
                    self.delegate?.getReceivedData(Modes.GETCATEGORIES, data: nil)
                    
                case .Failure(let error):
                    
                    print("Request failed with error: \(error)")
                }
        }
    }
    func getCategoryWallpapers(category:Category){
        
        let urlString = URLs.BASEURL + category.url
        
        Alamofire.request(.GET, urlString)
            .responseJSON { response in
                
                switch response.result {
                case .Success(let data):
                    
                    let json = JSON(data)
                    print("Data: \(json)")
                    
                    let wallpaperArray = json["category"].array
                    
                    for data in wallpaperArray!{
                        let title = data["title"].stringValue;
                        let url = data["url"].stringValue;
                        let byline = data["byline"].stringValue;
                        let thumbnail = data["thumbnail"].stringValue;
                        
                        let wallpaper = Wallpaper(title: title, url: url, byline: byline, thumbnail: thumbnail)
                        
                        category.addWallpaper(wallpaper)
                    }
                    
                    WallpprsManager.sharedInstance.replaceCategory(category)
                    
                    self.delegate?.getReceivedData(Modes.GETCATEGORYWALLPAPERS, data: category)
                    
                case .Failure(let error):
                    
                    print("Request failed with error: \(error)")
                }
        }
    }
}
