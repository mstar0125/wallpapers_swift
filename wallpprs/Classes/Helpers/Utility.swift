//
//  Utility.swift
//  wallpprs
//
//  Created by mac on 12/1/15.
//  Copyright © 2015 Ben Folds. All rights reserved.
//

import UIKit
import MBProgressHUD

class Utility {
    static let sharedInstance = Utility()
    
    func showMessage(view:UIView, text: String){
        let loadingNotification = MBProgressHUD.showHUDAddedTo(view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.Indeterminate
        loadingNotification.labelText = text
    }
    
    func hideMessage(view: UIView){
        MBProgressHUD.hideAllHUDsForView(view, animated: true)
    }
}
