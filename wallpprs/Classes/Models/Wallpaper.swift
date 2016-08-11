//
//  Wallpaper.swift
//  wallpprs
//
//  Created by mac on 12/2/15.
//  Copyright © 2015 Ben Folds. All rights reserved.
//

import UIKit

class Wallpaper: NSObject {
    var title:String = ""
    var url:String = ""
    var byline:String = ""
    var thumbnail:String = ""
    
    init(title: String, url: String, byline: String, thumbnail: String){
        self.title = title
        self.url = url
        self.byline = byline
        self.thumbnail = thumbnail
    }
}
