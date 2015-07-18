//
//  SearchImpl.swift
//  lvn
//
//  Created by admin on 7/12/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class SearchImpl {
    let TAG = "SearchImpl"
    var coreViet: CoreVietDBImpl
    var lang: String
//    var listViet: [TblVietEx]!
    var viewDelegate: PhrasesViewDelegate
    init(lang: String, viewDelegate: PhrasesViewDelegate){
        self.lang = lang
        self.viewDelegate = viewDelegate
        coreViet = CoreVietDBImpl(lang: self.lang)
    }
    
    func loadData(){
        
        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        if let listData = self.coreViet.fetchPhrasesData(0) {
            Log.print(self.TAG, msg: "load finish count: \(listData.count)")
            var listEx = [TblVietEx]()
            
            if listData.count > 0 {
                listEx = Utility.convertObject(lang, listViet: listData)!
                //                     Log.print(self.TAG, msg: "finish convert")
                self.viewDelegate.loadPhrases(listEx)
            }
        }else{
            Log.print(self.TAG, msg: " *************** load data fail")
        }
        //        })
    }
    
    
    
    //    func getObj
    
    
}
