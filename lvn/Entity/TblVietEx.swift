//
//  TblVietEx.swift
//  lvn
//
//  Created by admin on 5/8/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

struct TblVietEx {
    var viet: String
    var other: String
    var arrViet: NSMutableAttributedString!
    var arrOther: NSMutableAttributedString!
    var kind: Int
    var img: String
//    init(viet: String, other: String, kind: Int, img: String, arrViet: NSAttributedString, arrOther: NSAttributedString){
//        self.viet = viet
//        self.other = other
//        self.kind = kind
//        self.img = img
//        self.arrViet = arrViet
//        self.arrOther = arrOther
//    }
//
    init(viet: String, other: String, kind: Int, img: String){
        self.viet = viet
        self.other = other
        self.kind = kind
        self.img = img
        
        let start1 = "\u{1}"
        let end1 = "\u{2}"
        let start2 = "\u{3}"
        let end2 = "\u{4}"
        
        var valueStart1 = 0
        var valueEnd1 = 0
        var valueStart2 = 0
        var valueEnd2 = 0
        

        
        if var rangeS1 = viet.rangeOfString(start1){
            valueStart1 = distance(viet.startIndex, rangeS1.startIndex)
            
            if var rangeE2 = viet.rangeOfString(end1){
                valueEnd1 = distance(viet.startIndex, rangeE2.startIndex)
            }
        }
        
        if var rangeS2 = viet.rangeOfString(start2){
            valueStart2 = distance(viet.startIndex, rangeS2.startIndex)
            
            if var rangeE2 = viet.rangeOfString(end2){
                valueEnd2 = distance(viet.startIndex, rangeE2.startIndex)
            }
        }

        
        arrViet = NSMutableAttributedString(string: viet, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 18.0)!])
        
        arrViet.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:valueStart1,length:valueEnd1 - valueStart1))
 
        arrViet.addAttribute(NSForegroundColorAttributeName, value: UIColor.greenColor(), range: NSRange(location:valueStart2,length:valueEnd2 - valueStart2))
        
        ///
        if var rangeS1 = other.rangeOfString(start1){
            valueStart1 = distance(other.startIndex, rangeS1.startIndex)
            
            if var rangeE2 = other.rangeOfString(end1){
                valueEnd1 = distance(other.startIndex, rangeE2.startIndex)
            }
        }
        
        if var rangeS2 = other.rangeOfString(start2){
            valueStart2 = distance(other.startIndex, rangeS2.startIndex)
            
            if var rangeE2 = other.rangeOfString(end2){
                valueEnd2 = distance(other.startIndex, rangeE2.startIndex)
            }
        }
        
        
        arrOther = NSMutableAttributedString(string: other, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 16.0)!])
        
        arrOther.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:valueStart1,length:valueEnd1 - valueStart1))
        
        arrOther.addAttribute(NSForegroundColorAttributeName, value: UIColor.greenColor(), range: NSRange(location:valueStart2,length:valueEnd2 - valueStart2))

        
        
//        arrOther = myMutableString
    }

    

}
