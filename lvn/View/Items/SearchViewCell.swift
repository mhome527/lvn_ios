//
//  SearchViewCell.swift
//  lvn
//
//  Created by admin on 7/12/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class SearchViewCell: UITableViewCell {

    let TAG = "SearchViewCell"
    @IBOutlet weak var lblViet: UILabel!
    @IBOutlet weak var lblOther: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(vi: String, o1: String, img: String){
        if let img = UIImage(named: "images/\(img).png") {
            //            img.alpha(0.5)
            imgView.image = img
            imgView?.hidden = false
        }else{
            imgView?.hidden = true
        }
        lblViet.text = vi
        lblOther.text = o1

    }

}
