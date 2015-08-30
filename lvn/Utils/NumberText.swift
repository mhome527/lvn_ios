//
//  NumberText.swift
//  lvn
//
//  Created by admin on 6/26/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class NumberText{
    
    static let mangso = ["không","một","hai","ba","bốn","năm","sáu","bảy","tám","chín"]

    static func dochangchuc(so: Int, daydu: Bool) -> String
    {
        var chuoi = "";
        var chuc = so/10;
        var donvi:Int = so%10;
        if (chuc>1) {
            chuoi = " " + NumberText.mangso[chuc] + " mươi";
            if (donvi==1) {
                chuoi += " mốt";
            }
        } else if (chuc==1) {
            chuoi = " mười";
            if (donvi==1) {
                chuoi += " một";
            }
        } else if daydu && donvi > 0  {
            chuoi = " lẻ";
        }
        if (donvi==5 && chuc>=1) {
            chuoi += " lăm";
        } else if (donvi>1||(donvi==1&&chuc==0)) {
            chuoi += " " + NumberText.mangso[ donvi ];
        }
        return chuoi;
    }

    static func docblock(so1:Int, daydu: Bool) -> String
    {
        var chuoi = "";
        var tram:Int = so1/100;
        var so:Int = so1%100;
        if daydu || tram > 0 {
            chuoi = " " + NumberText.mangso[tram] + " trăm";
            chuoi += dochangchuc(so, daydu:true);
        } else {
            chuoi = dochangchuc(so, daydu:false);
        }
        return chuoi;
    }

    static func dochangtrieu(so1:Int, daydu1: Bool) -> String
    {
        var chuoi = "";
        var trieu:Int = so1/1000000;
        var so:Int = so1%1000000;
        var daydu:Bool = daydu1
        if (trieu>0) {
            chuoi = docblock(trieu, daydu:daydu) + " triệu";
            daydu = true;
        }
        var nghin:Int = so/1000;
        so = so%1000;
        if (nghin>0) {
            chuoi += docblock(nghin, daydu:daydu) + " ngàn";
            daydu = true;
        }
        if (so>0) {
            chuoi += docblock(so, daydu:daydu);
        }
        return chuoi;
    }

    static func convertNumberToChar(var so:Int64) -> String{
        var chuoi = "", hauto = "";
        var ty:Int
        if so == 0 {
            return NumberText.mangso[0]
        }
        
        do {
            ty = Int(so % 1000000000);
            so = so/1000000000
            if so > 0 {
                chuoi = NumberText.dochangtrieu(ty, daydu1: true) + hauto + chuoi;
            } else {
                chuoi = NumberText.dochangtrieu(ty, daydu1: false) + hauto + chuoi;
            }
            hauto = " tỷ";
        } while (so > 0);
        return chuoi
    }

}