//
//  Category.swift
//  wallpprs
//
//  Created by mac on 11/26/15.
//  Copyright © 2015 Ben Folds. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var title:String = ""
    var url:String = ""
    var wallpapers = Set<Wallpaper>()
    
    init(title: String, url: String){
        self.title = title;
        self.url = url;
    }
    
    func setCategoryWallpapers(wallpapers:[Wallpaper]){
        for wallpaper in wallpapers {
            self.wallpapers.insert(wallpaper)
        }
    }
    func addWallpaper(wallpaper:Wallpaper){
        self.wallpapers.insert(wallpaper)
    }
}
