//
//  WordsImpl.swift
//  lvn
//
//  Created by admin on 6/9/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class WordsImpl{
    let TAG = "WordsImpl"
    var coreViet: CoreVietDBImpl
    var lang: String = ""
    var viewDelegate: WordsViewDelegate
//    var kind: Int = 1
    
    init(lang: String, viewDelegate: WordsViewDelegate){
        self.lang = lang
        self.viewDelegate = viewDelegate
        coreViet = CoreVietDBImpl(lang: self.lang)
    }
    
    func loadData(kind: Int){
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            if let listData = self.coreViet.fetchPhrasesData(kind) {
                Log.print(self.TAG, msg: "load finish count: \(listData.count)")

                self.viewDelegate.loadWords(self.convertObject(listData)!)
               
            }else{
                Log.print(self.TAG, msg: " *************** load data fail")
            }
//        })

    
    }
    
    ///////
    func convertObject(listViet: [AnyObject]) -> [TblVietEx]?{
        var tblVietEx = [TblVietEx]()
        if lang == "\(Constant.ContryName.JA.rawValue)"  {
            if let listV = listViet as? [TblVietJA] {
                for entity in listV {

                    let tbl = TblVietEx(viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    
                    tblVietEx.append(tbl)
                }
                
            }
        }else if lang == "\(Constant.ContryName.KO.rawValue)" {
            if let listV = listViet as? [TblVietKO] {
                Log.print(TAG, msg: "KO list data: \(listV.count)")
                for entity in listV {
                    
                    let tbl = TblVietEx( viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    
                    tblVietEx.append(tbl)
                }
                
            }
        }else  if lang == "\(Constant.ContryName.FR.rawValue)" {
            if let listV = listViet as? [TblVietFR] {
                Log.print(TAG, msg: "FR list data: \(listV.count)")
                for entity in listV {
                    let tbl = TblVietEx( viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    
                    tblVietEx.append(tbl)
                }
            }
        }else  if lang == "\(Constant.ContryName.RU.rawValue)" {
            if let listV = listViet as? [TblVietRU] {
                Log.print(TAG, msg: "RU list data: \(listV.count)")
                for entity in listV {
        
                    let tbl = TblVietEx( viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    
                    tblVietEx.append(tbl)
                }
                
            }
        }else  {
            if let listV = listViet as? [TblVietEN] {
                // Log.print(TAG, msg: "EN list data: \(listV.count)")
                for entity in listV {
                 
                    
                    let tbl = TblVietEx(viet: entity.vi, other: entity.o1, kind: Int(entity.kind), img: entity.img)
                    //                     Log.print(TAG, msg: "EN append 4 ......")
                    tblVietEx.append(tbl)
                }
                
            }
        }
        return tblVietEx
        
    }
}
