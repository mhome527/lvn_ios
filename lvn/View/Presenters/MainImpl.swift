//
//  MainImpl.swift
//  lvn
//
//  Created by admin on 4/24/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit
//import SwiftyJSON

class MainImpl {
    let TAG = "MainImple"
    var lang: String
    var vietDBImpl: CoreVietDBImpl!
    
    init(){
        self.lang = "EN"
//        vietDBImpl = CoreVietDBImpl(lang: lang)
//       let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    }
    
    func loadJson(){
        
        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        
        vietDBImpl = CoreVietDBImpl(lang: "EN")
        if let path = NSBundle.mainBundle().pathForResource("en", ofType: "txt") {
               
            if let data = NSData(contentsOfMappedFile: path) {
                     Log.print(self.TAG, msg:"loadJson en ...")
                    let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                    self.vietDBImpl.saveVietTable(json)
            }else {
                     Log.print(self.TAG, msg:"loadJson v-e ERROR!!!!!")
            }
        }
        
        vietDBImpl = CoreVietDBImpl(lang: "JA")
        if let path = NSBundle.mainBundle().pathForResource("ja", ofType: "txt") {
            
            if let data = NSData(contentsOfMappedFile: path) {
                Log.print(self.TAG, msg:"loadJson JA ...")
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                self.vietDBImpl.saveVietTable(json)
            }else {
                Log.print(self.TAG, msg:"loadJson v-j ERROR!!!!!")
            }
        }
        
        vietDBImpl = CoreVietDBImpl(lang: "KO")
        if let path = NSBundle.mainBundle().pathForResource("ko", ofType: "txt") {
            
            if let data = NSData(contentsOfMappedFile: path) {
                Log.print(self.TAG, msg:"loadJson KO ...")
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                self.vietDBImpl.saveVietTable(json)
            }else {
                Log.print(self.TAG, msg:"loadJson v-k ERROR!!!!!")
            }
        }
        
        vietDBImpl = CoreVietDBImpl(lang: "FR")
        if let path = NSBundle.mainBundle().pathForResource("fr", ofType: "txt") {
            
            if let data = NSData(contentsOfMappedFile: path) {
                Log.print(self.TAG, msg:"loadJson FR ...")
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                self.vietDBImpl.saveVietTable(json)
            }else {
                Log.print(self.TAG, msg:"loadJson v-f ERROR!!!!!")
            }
        }
        
        vietDBImpl = CoreVietDBImpl(lang: "RU")
        if let path = NSBundle.mainBundle().pathForResource("ru", ofType: "txt") {
            
            if let data = NSData(contentsOfMappedFile: path) {
                Log.print(self.TAG, msg:"loadJson RU ...")
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                self.vietDBImpl.saveVietTable(json)
            }else {
                Log.print(self.TAG, msg:"loadJson v-r ERROR!!!!!")
            }
        }
//        })
        Log.print(TAG, msg: "loadJson finish")
    }
    
    
    func loadRecJson(){
        
        vietDBImpl = CoreVietDBImpl(lang: "EN")
        if let path = NSBundle.mainBundle().pathForResource("rec_en", ofType: "txt") {
            
            if let data = NSData(contentsOfMappedFile: path) {
                Log.print(self.TAG, msg:"loadRecJson en...")
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                self.vietDBImpl.saveRecTable(json)
            }else {
                Log.print(self.TAG, msg:"loadRecJson v-e ERROR!!!!!")
            }
        }
        
        vietDBImpl = CoreVietDBImpl(lang: "JA")
        if let path = NSBundle.mainBundle().pathForResource("rec_ja", ofType: "txt") {
            
            if let data = NSData(contentsOfMappedFile: path) {
                Log.print(self.TAG, msg:"loadRecJson ja...")
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                self.vietDBImpl.saveRecTable(json)
            }else {
                Log.print(self.TAG, msg:"loadRecJson v-j ERROR!!!!!")
            }
        }
        
        vietDBImpl = CoreVietDBImpl(lang: "KO")
        if let path = NSBundle.mainBundle().pathForResource("rec_ko", ofType: "txt") {
            
            if let data = NSData(contentsOfMappedFile: path) {
                Log.print(self.TAG, msg:"loadRecJson ko...")
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                self.vietDBImpl.saveRecTable(json)
            }else {
                Log.print(self.TAG, msg:"loadRecJson v-k ERROR!!!!!")
            }
        }
        
        vietDBImpl = CoreVietDBImpl(lang: "FR")
        if let path = NSBundle.mainBundle().pathForResource("rec_fr", ofType: "txt") {
            
            if let data = NSData(contentsOfMappedFile: path) {
                Log.print(self.TAG, msg:"loadRecJson fr...")
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                self.vietDBImpl.saveRecTable(json)
            }else {
                Log.print(self.TAG, msg:"loadRecJson v-f ERROR!!!!!")
            }
        }
        
        vietDBImpl = CoreVietDBImpl(lang: "RU")
        if let path = NSBundle.mainBundle().pathForResource("rec_ru", ofType: "txt") {
            
            if let data = NSData(contentsOfMappedFile: path) {
                Log.print(self.TAG, msg:"loadRecJson ru...")
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                self.vietDBImpl.saveRecTable(json)
            }else {
                Log.print(self.TAG, msg:"loadRecJson v-r ERROR!!!!!")
            }
        }
        Log.print(TAG, msg: "loadRecJson finish")

    }
}
