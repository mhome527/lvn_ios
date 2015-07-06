//
//  ViewController.swift
//  lvn
//
//  Created by admin on 4/16/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var refreshItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var image = UIImage(named: "ic_settings.png")
        refreshItem.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func refreshItemtapped(sender: AnyObject) {
        println("refreshItemtapped....")
    }
}

