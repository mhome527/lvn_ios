//
//  Utility.swift
//  lvn
//
//  Created by admin on 7/12/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

public class Utility{
    static let TAG = "Utility"
    static func convertObject(lang: String, listViet: [AnyObject]) -> [TblVietEx]?{
        var tblVietEx = [TblVietEx]()
        if lang == "\(Constant.ContryName.JA.rawValue)"  {
            if let listV = listViet as? [TblVietJA] {
                for entity in listV {
                    
//                    let attrViet = NSAttributedString(
//                        data: entity.vi.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
//                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                        documentAttributes: nil,
//                        error: nil)
//                    
//                    let attrOther = NSAttributedString(
//                        data: entity.o1.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
//                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                        documentAttributes: nil,
//                        error: nil)
                    
                    let tbl = TblVietEx(viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    
                    tblVietEx.append(tbl)
                }
                
            }
        }else if lang == "\(Constant.ContryName.KO.rawValue)" {
            if let listV = listViet as? [TblVietKO] {
                Log.print(TAG, msg: "KO list data: \(listV.count)")
                for entity in listV {
                    
//                    let attrViet = NSAttributedString(
//                        data: entity.vi.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
//                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                        documentAttributes: nil,
//                        error: nil)
//                    
//                    let attrOther = NSAttributedString(
//                        data: entity.o1.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
//                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                        documentAttributes: nil,
//                        error: nil)
                    
                    let tbl = TblVietEx( viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    
                    tblVietEx.append(tbl)
                }
                
            }
        }else  if lang == "\(Constant.ContryName.FR.rawValue)" {
            if let listV = listViet as? [TblVietFR] {
                Log.print(TAG, msg: "FR list data: \(listV.count)")
                for entity in listV {
                    
//                    let attrViet = NSAttributedString(
//                        data: entity.vi.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
//                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                        documentAttributes: nil,
//                        error: nil)
//                    
//                    let attrOther = NSAttributedString(
//                        data: entity.o1.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
//                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                        documentAttributes: nil,
//                        error: nil)
                    
                    let tbl = TblVietEx( viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    
                    tblVietEx.append(tbl)
                }
            }
        }else  if lang == "\(Constant.ContryName.RU.rawValue)" {
            if let listV = listViet as? [TblVietRU] {
                Log.print(TAG, msg: "RU list data: \(listV.count)")
                for entity in listV {
                    
//                    let attrViet = NSAttributedString(
//                        data: entity.vi.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
//                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                        documentAttributes: nil,
//                        error: nil)
//                    
//                    let attrOther = NSAttributedString(
//                        data: entity.o1.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
//                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//                        documentAttributes: nil,
//                        error: nil)
                    
                    let tbl = TblVietEx( viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    
                    tblVietEx.append(tbl)
                }
                
            }
        }else  {
            if let listV = listViet as? [TblVietEN] {
                //                Log.print(TAG, msg: "EN list data: \(listV.count)")
                for entity in listV {
                    //
                    //                    let attrViet = NSAttributedString(
                    //                        data: entity.vi.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                    //                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                    //                        documentAttributes: nil,
                    //                        error: nil)
                    //
                    //                    let attrOther = NSAttributedString(
                    //                        data: entity.o1.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                    //                        options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                    //                        documentAttributes: nil,
                    //                        error: nil)
                    
                    //                    let tbl = TblVietEx( viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img, arrViet: attrViet!, arrOther: attrOther!)
                    
                    let tbl = TblVietEx(viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    //                     Log.print(TAG, msg: "EN append 4 ......")
                    tblVietEx.append(tbl)
                }
                
            }
        }
        return tblVietEx
        
    }
    
    static func controllerAvailable(className: String) -> Bool{
        if let gotModernClass: AnyClass = NSClassFromString(className) {
            return true
        }
        else {
            return false
        }
    }
    
    //write to NSUserDefaults
    static func saveObj(key: String, entity: AnyObject){
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(entity), forKey: key)
        userDefaults.synchronize();
    }
    
    // read to NSUserDefaults
    static func getObj(key: String) -> AnyObject? {
        
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if let data = userDefaults.objectForKey(key) as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(data)!
        }
        return nil
        //        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        //        var data = userDefaults.objectForKey(key) as? NSData
        //        return NSKeyedUnarchiver.unarchiveObjectWithData(data!)!
    }
    
    //remove NSUserDefaults
    static func clearAllObj() {
        let appDomain = NSBundle.mainBundle().bundleIdentifier!
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
    }
    

}
