//
//  MainImpl.swift
//  lvn
//
//  Created by admin on 4/24/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainImpl {
    let TAG = "MainImple"
    var lang: String
    var vietDBImpl: CoreVietDBImpl
    
    init(){
        self.lang = "EN"
        vietDBImpl = CoreVietDBImpl(lang: lang)
//       let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    }
    
    func loadJson(){
        
        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            if let path = NSBundle.mainBundle().pathForResource("en", ofType: "txt") {
               
                if let data = NSData(contentsOfMappedFile: path) {
                     Log.print(self.TAG, msg:"loadJson 2...")
                    let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                    self.vietDBImpl.saveVietTable(json)
                }
            }
//        })
        Log.print(TAG, msg: "loadJson ...")
    }
}
