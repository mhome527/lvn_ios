//
//  Log.swift
//  GnhNotification
//
//  Created by admin on 4/9/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import Foundation

class Log{
    static func print(TAG: String, msg: AnyObject){
        if Constant.IS_DEBUG == true {
            println("\n\(TAG) --> \(msg)")
        }
    }
}