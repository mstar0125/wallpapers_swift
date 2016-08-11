//
//  Constants.swift
//  wallpprs
//
//  Created by Ben Folds on 11/27/15.
//  Copyright (c) 2015 Ben Folds. All rights reserved.
//

import Foundation

// MARK: - Wallpprs API URL

struct URLs {
    static let BASEURL = "https://wallpprs.com"
    static let GETLATESTWALLPAPERS = "https://wallpprs.com/latest/json"
    static let GETCATEGORIES = "https://wallpprs.com/categories/json"
    static let GETCATEGORYWALLPAPERS = "https://wallpprs.com/%@/json"
    static let GETWALLPAPERDETAILS = "https://wallpprs.com/wallpapers/%@/json"
    static let SEARCHWALLPAPARES = "https://wallpprs.com/search/json?query=%@"
}

// MARK: - Wallpprs API Mode

struct Modes {
    
    static let GETLATESTWALLPAPERS = 1
    static let GETCATEGORIES = 2
    static let GETCATEGORYWALLPAPERS = 3
    static let GETWALLPAPERDETAILS = 4
    static let SEARCHWALLPAPARES = 5
}