//
//  NumberViewCell.swift
//  lvn
//
//  Created by admin on 8/16/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class NumberViewCell: UICollectionViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    func setData(word: String, numberText: String){
        numberLabel.text = word
        textLabel.text = numberText
    }
}
