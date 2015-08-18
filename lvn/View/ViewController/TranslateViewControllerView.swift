//
//  TranslateViewControllerView.swift
//  lvn
//
//  Created by admin on 8/14/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class TranslateViewControllerView: BaseViewController {
    
    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "https://translate.google.com/?hl=en#en/vi/");
        let requestObj = NSURLRequest(URL: url!);
        webview.loadRequest(requestObj);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
}

