//
//  WordViewCell.swift
//  lvn
//
//  Created by admin on 6/9/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class WordViewCell : UICollectionViewCell{
    let TAG = "WordViewCell"
    @IBOutlet var imgWord: UIImageView!
    @IBOutlet var lblWord: UILabel!
    
    func setData(img: String, text: String){
        
//        if let img = UIImage(contentsOfFile: "fruits.png") {
////            imgWord.image = img
//
////        if let img = UIImage(named: "fruits.png", inBundle: NSBundle.mainBundle(),
////            compatibleWithTraitCollection: nil) {
////        if let path = NSBundle.mainBundle().pathForResource("fruits", ofType: "png") {
////            imgWord.image = UIImage(named: path)
//
//            let img = UIImage(contentsOfFile:path)
//            imgWord.image = img
//        }else{
//            Log.print(TAG, msg: "img: \(img) text: \(text)")
//        }

//                imgWord.image = UIImage(named: "apple.jpg")
        if let img = UIImage(named: "images/\(img).png") {
//            img.alpha(0.5)
            imgWord.image = img
        }else{
            Log.print(TAG, msg: "image cant create : \(img), text: \(text)")
        }

        lblWord.text = text
    }
    
}
