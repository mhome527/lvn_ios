//
//  PhrasesViewCell.swift
//  lvn
//
//  Created by admin on 5/7/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class PhrasesViewCell: UITableViewCell {

    @IBOutlet var vietLabel: UILabel!
    @IBOutlet var otherLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setView(vi: String, ot: String) {
//        vietLabel.attributedText = vi
//        otherLabel.attributedText = ot
        vietLabel.text = vi
        otherLabel.text = ot
        
//        Log.print("cell", msg: "setView...")
    }
    
    func setAttrView(vi: NSAttributedString, ot: NSAttributedString) {
        //        vietLabel.attributedText = vi
        //        otherLabel.attributedText = ot
        vietLabel.attributedText = vi
        otherLabel.attributedText = ot
        
        //        Log.print("cell", msg: "setView...")
    }

}
