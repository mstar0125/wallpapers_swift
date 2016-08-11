//
//  WallpprsManager.swift
//  wallpprs
//
//  Created by mac on 11/26/15.
//  Copyright © 2015 Ben Folds. All rights reserved.
//

import UIKit

class WallpprsManager {
    
    static let sharedInstance = WallpprsManager()
    var categories: [Category]?
    
    // METHODS
    private init() {
        print(__FUNCTION__)
    }
    
    func replaceCategory(newCategory: Category){
        var currentIndex = 0
        for category in self.categories!{
            if category.title == newCategory.title{
                self.categories![currentIndex] = newCategory
                break
            }
            currentIndex++;
        }
    }
}
