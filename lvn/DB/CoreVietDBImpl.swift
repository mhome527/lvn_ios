//
//  CoreDBImpl.swift
//  lvn
//
//  Created by admin on 4/27/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit
import CoreData
//import SwiftyJSON

class CoreVietDBImpl {
    let TAG = "CoreDBImpl"
    let moc: NSManagedObjectContext

    let KEY_VIET = "listData"
    let KEY_KIND = "kind"
    let KEY_IMG = "img"
    let KEY_VI = "vi"
    let KEY_O1 = "o1"
    let KEY_O2 = "o2"
    let KEY_LEVEL = "level"
    let KEY_WORD = "default_word"
    
    //// REC
    let KEY_GROUP_ID = "group_id"
    let KEY_WORD_ID = "word_id"
    let KEY_VN = "vn"
    let KEY_EX = "ex"
    let KEY_OT = "ot"
    ////////////////////
    
    var lang: String

    let contry: ContryName
    init(lang: String){
        Log.print(TAG, msg: "init \(lang)")
        self.lang = lang
        contry = ContryName(rawValue: self.lang)!
        
         moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    }
    
    //ten table
    enum TableVietName: String {
        case VIET_EN = "TblVietEN"
        case VIET_JA = "TblVietJA"
        case VIET_KO = "TblVietKO"
        case VIET_FR = "TblVietFR"
        case VIET_RU = "TblVietRU"
        
    }
    
    enum TableRecName: String {
        case EN = "TblRec_EN"
        case JA = "TblRec_JA"
        case KO = "TblRec_KO"
        case FR = "TblRec_FR"
        case RU = "TblRec_RU"
    }

    enum ContryName : String {
        case EN = "EN"
        case JA = "JA"
        case KO = "KO"
        case FR = "FR"
        case RU = "RU"
    }

    
///////////// get data
    func fetchPhrasesData(kind: Int) -> Array<AnyObject>? {
        Log.print(TAG, msg: "fetchData \(lang)")
        var fetchResults: AnyObject
        let fetchRequest = NSFetchRequest(entityName: getTableVietName(lang))
        
        //        // property of the Core Data object
        //        let sortDescriptor = NSSortDescriptor(key: KEY_DATE, ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        //        fetchRequest.sortDescriptors = [sortDescriptor]
        //        let predicate = NSPredicate(format: "%K >= %@", KEY_DATE, 2222)
        
        //kind = 0: search all
        if kind != 0 {
            let predicate = NSPredicate(format: "\(KEY_KIND) = \(kind)")
            // Set the predicate on the fetch request
            fetchRequest.predicate = predicate
            
            // newest first
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "vi", ascending: true)]
        }
        return moc.executeFetchRequest(fetchRequest, error: nil)
        
    }
/////////
    

    func saveVietTable(json: JSON){
         Log.print(TAG, msg: "saveVietTable listData ....")
        let listData = json[KEY_VIET].arrayValue
        Log.print(TAG, msg: "saveVietTable listData count: \(listData.count); lang:\(contry.rawValue)")
        for entity in listData {
           saveTblObj(entity)
        }
    }
    
    func getTableVietName(lang: String) -> String {
      
        switch contry {
        case .JA: return TableVietName.VIET_JA.rawValue
        case .KO: return TableVietName.VIET_KO.rawValue
        case .FR: return TableVietName.VIET_FR.rawValue
        case .RU: return TableVietName.VIET_RU.rawValue
        default: return TableVietName.VIET_EN.rawValue
        }
    }
    
    func saveTblObj(json: JSON){
        let kind = json[KEY_KIND].int
        let vi = json[KEY_VI].stringValue
        let o1 = json[KEY_O1].stringValue
        let o2 = json[KEY_O2].stringValue
        let level = json[KEY_LEVEL].int
        let word = json[KEY_WORD].stringValue
        let img = json[KEY_IMG].stringValue
        
        switch contry {
        case .JA: saveTblVietJA(kind!, vi: vi, o1: o1, o2: o2, level: level!, word: word, img: img)
        case .KO: saveTblVietKO(kind!, vi: vi, o1: o1, o2: o2, level: level!, word: word, img: img)
        case .FR: saveTblVietFR(kind!, vi: vi, o1: o1, o2: o2, level: level!, word: word, img: img)
        case .RU: saveTblVietRU(kind!, vi: vi, o1: o1, o2: o2, level: level!, word: word, img: img)
        default: saveTblVietEN(kind!, vi: vi, o1: o1, o2: o2, level: level!, word: word, img: img)
        }
    }
    
    
    func saveTblVietEN(kind: Int, vi: String, o1: String, o2: String, level: Int, word: String, img: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableVietName.VIET_EN.rawValue, inManagedObjectContext: moc) as! TblVietEN
        let newString = replaceText(vi, o1: o1)
       
        entity.kind = kind
        entity.vi = newString.viNew
        entity.o1 = newString.o1New
        entity.o2 = o2
        entity.level = level
        entity.default_word = word
        entity.img = img
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }

    }
    
    func saveTblVietJA(kind: Int, vi: String, o1: String, o2: String, level: Int, word: String, img: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableVietName.VIET_JA.rawValue, inManagedObjectContext: moc) as! TblVietJA
        let newString = replaceText(vi, o1: o1)
        
        entity.kind = kind
        entity.vi = newString.viNew
        entity.o1 = newString.o1New
        entity.o2 = o2
        entity.level = level
        entity.default_word = word
        entity.img = img
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }
    }

    func saveTblVietKO(kind: Int, vi: String, o1: String, o2: String, level: Int, word: String, img: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableVietName.VIET_KO.rawValue, inManagedObjectContext: moc) as! TblVietKO
        let newString = replaceText(vi, o1: o1)
        
        entity.kind = kind
        entity.vi = newString.viNew
        entity.o1 = newString.o1New
        entity.o2 = o2
        entity.level = level
        entity.default_word = word
        entity.img = img
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }
    }

    func saveTblVietFR(kind: Int, vi: String, o1: String, o2: String, level: Int, word: String, img: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableVietName.VIET_FR.rawValue, inManagedObjectContext: moc) as! TblVietFR
        let newString = replaceText(vi, o1: o1)
        
        entity.kind = kind
        entity.vi = newString.viNew
        entity.o1 = newString.o1New
        entity.o2 = o2
        entity.level = level
        entity.default_word = word
        entity.img = img
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }
    }

    func saveTblVietRU(kind: Int, vi: String, o1: String, o2: String, level: Int, word: String, img: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableVietName.VIET_RU.rawValue, inManagedObjectContext: moc) as! TblVietRU
        let newString = replaceText(vi, o1: o1)
        
        entity.kind = kind
        entity.vi = newString.viNew
        entity.o1 = newString.o1New
        entity.o2 = o2
        entity.level = level
        entity.default_word = word
        entity.img = img
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }
    }
    ////////////////////////
    
    //////////// REC //////////////
    func saveRecTable(json: JSON){
        Log.print(TAG, msg: "saveRecTable listData ....")
        let listData = json[KEY_VIET].arrayValue
        Log.print(TAG, msg: "saveRecTable listData count: \(listData.count); lang:\(contry.rawValue)")
        for entity in listData {
            saveTblRecObj(entity)
        }
    }
    
    func getTableRecName(lang: String) -> String {
        
        switch contry {
            case .JA: return TableRecName.JA.rawValue
            case .KO: return TableRecName.KO.rawValue
            case .FR: return TableRecName.FR.rawValue
            case .RU: return TableRecName.RU.rawValue
            default: return TableRecName.EN.rawValue
        }
    }
    
    func saveTblRecObj(json: JSON){
        let group_id = json[KEY_GROUP_ID].int
        let word_id = json[KEY_WORD_ID].int
        let vn = json[KEY_VN].stringValue
        let ex = json[KEY_EX].stringValue
        let ot = json[KEY_OT].stringValue
        
        switch contry {
            case .JA: saveTblREC_JA(group_id!, word_id: word_id!, vn: vn, ex: ex, ot:ot)
            case .KO: saveTblREC_KO(group_id!, word_id: word_id!, vn: vn, ex: ex, ot:ot)
            case .FR: saveTblREC_FR(group_id!, word_id: word_id!, vn: vn, ex: ex, ot:ot)
            case .RU: saveTblREC_RU(group_id!, word_id: word_id!, vn: vn, ex: ex, ot:ot)
            default:  saveTblREC_EN(group_id!, word_id: word_id!, vn: vn, ex: ex, ot:ot)
        }
    }

    
    func saveTblREC_EN(group_id: Int, word_id: Int, vn: String, ex: String, ot: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableRecName.EN.rawValue, inManagedObjectContext: moc) as! TblRec_EN
        
        entity.group_id = group_id
        entity.word_id = word_id
        entity.vn = vn
        entity.ex = ex
        entity.ot = ot
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }
        
    }
    
    func saveTblREC_JA(group_id: Int, word_id: Int, vn: String, ex: String, ot: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableRecName.JA.rawValue, inManagedObjectContext: moc) as! TblRec_JA
        
        entity.group_id = group_id
        entity.word_id = word_id
        entity.vn = vn
        entity.ex = ex
        entity.ot = ot
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }
        
    }
    
    func saveTblREC_KO(group_id: Int, word_id: Int, vn: String, ex: String, ot: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableRecName.KO.rawValue, inManagedObjectContext: moc) as! TblRec_KO
        
        entity.group_id = group_id
        entity.word_id = word_id
        entity.vn = vn
        entity.ex = ex
        entity.ot = ot
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }
        
    }
    
    func saveTblREC_FR(group_id: Int, word_id: Int, vn: String, ex: String, ot: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableRecName.FR.rawValue, inManagedObjectContext: moc) as! TblRec_FR
        
        entity.group_id = group_id
        entity.word_id = word_id
        entity.vn = vn
        entity.ex = ex
        entity.ot = ot
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }
        
    }
    
    func saveTblREC_RU(group_id: Int, word_id: Int, vn: String, ex: String, ot: String){
        let entity = NSEntityDescription.insertNewObjectForEntityForName(TableRecName.RU.rawValue, inManagedObjectContext: moc) as! TblRec_RU
        
        entity.group_id = group_id
        entity.word_id = word_id
        entity.vn = vn
        entity.ex = ex
        entity.ot = ot
        
        var error : NSError?
        moc.save(&error)
        if error != nil {
            Log.print(TAG, msg: error!.description)
        }
        
    }
    
    
    ////////////////// END REC /////////////////
    
    func replaceText(vi: String, o1: String) -> (viNew: String, o1New: String) {
        let start1 = "\u{1}"
        let end1 = "\u{2}"
        let start2 = "\u{3}"
        let end2 = "\u{4}"
        var viTmp = vi.stringByReplacingOccurrencesOfString("{1}", withString: start1).stringByReplacingOccurrencesOfString("{2}", withString: end1).stringByReplacingOccurrencesOfString("{3}", withString: start2).stringByReplacingOccurrencesOfString("{4}", withString: end2)
        
        var o1Tmp = o1.stringByReplacingOccurrencesOfString("{1}", withString: start1).stringByReplacingOccurrencesOfString("{2}", withString: end1).stringByReplacingOccurrencesOfString("{3}", withString: start2).stringByReplacingOccurrencesOfString("{4}", withString: end2)
        
        return (viTmp, o1Tmp)
    }
   
}