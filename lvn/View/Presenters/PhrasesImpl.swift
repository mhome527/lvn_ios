//
//  PhrasesImpl.swift
//  lvn
//
//  Created by admin on 5/2/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit
//import SwiftyJSON


class PhrasesImpl {
    let TAG = "PharsesImpl"
    var coreViet: CoreVietDBImpl
    var lang: String
    var listViet: [AnyObject]!
    var viewDelegate: PhrasesViewDelegate
    init(lang: String, viewDelegate: PhrasesViewDelegate){
        self.lang = lang
        self.viewDelegate = viewDelegate
        coreViet = CoreVietDBImpl(lang: self.lang)
    }
    
    func loadData(){
        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            if let listData = self.coreViet.fetchPhrasesData(11) {
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
    

    

}
