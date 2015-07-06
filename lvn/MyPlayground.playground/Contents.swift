
import UIKit

var mangso = ["không","một","hai","ba","bốn","năm","sáu","bảy","tám","chín"]

func dochangchuc(so: Int, daydu: Bool) -> String
{
    var chuoi = "";
    var chuc = so/10;
    var donvi:Int = so%10;
    if (chuc>1) {
        chuoi = " " + mangso[chuc] + " mươi";
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
    if (donvi==5 && chuc>1) {
        chuoi += " lăm";
    } else if (donvi>1||(donvi==1&&chuc==0)) {
        chuoi += " " + mangso[ donvi ];
    }
    return chuoi;
}

func docblock(so1:Int, daydu: Bool) -> String
    {
        var chuoi = "";
        var tram:Int = so1/100;
        var so:Int = so1%100;
        if daydu || tram > 0 {
            chuoi = " " + mangso[tram] + " trăm";
            chuoi += dochangchuc(so,true);
        } else {
            chuoi = dochangchuc(so,false);
        }
        return chuoi;
}

func dochangtrieu(so1:Int, daydu1: Bool) -> String
    {
        var chuoi = "";
        var trieu:Int = so1/1000000;
        var so:Int = so1%1000000;
        var daydu:Bool = daydu1
        if (trieu>0) {
            chuoi = docblock(trieu,daydu) + " triệu";
            daydu = true;
        }
        var nghin:Int = so/1000;
        so = so%1000;
        if (nghin>0) {
            chuoi += docblock(nghin,daydu) + " nghìn";
            daydu = true;
        }
        if (so>0) {
            chuoi += docblock(so,daydu);
        }
        return chuoi;
}

func docso(var so:Int) -> String{
    var chuoi = "", hauto = "";
    var ty:Int
    if so == 0 {
        return mangso[0]
    }
    
    do {
        ty = so % 1000000000;
        so = so/1000000000
        if so > 0 {
            chuoi = dochangtrieu(ty,true) + hauto + chuoi;
        } else {
            chuoi = dochangtrieu(ty,false) + hauto + chuoi;
        }
        hauto = " tỷ";
    } while (so>0);
    return chuoi;
}

var x = docso(1910)
var y = docso(100000000000000)



