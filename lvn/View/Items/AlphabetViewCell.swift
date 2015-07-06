//
//  AlphabetViewCell.swift
//  lvn
//
//  Created by admin on 4/17/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class AlphabetViewCell: UICollectionViewCell {
    
    @IBOutlet var upperLabel: UILabel!
    
    @IBOutlet var lowerLabel: UILabel!
    
    func setData(word: String){
        upperLabel.text = word
        lowerLabel.text = word
    }
}
