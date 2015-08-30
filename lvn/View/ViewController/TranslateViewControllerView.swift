//
//  TranslateViewControllerView.swift
//  lvn
//
//  Created by admin on 8/14/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class TranslateViewControllerView: BaseViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView.startAnimating()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "https://translate.google.com/?hl=en#en/vi/");
        let requestObj = NSURLRequest(URL: url!);
        webview.loadRequest(requestObj);
        webview.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Impl UIWebViewDelegate
    func webViewDidFinishLoad(webView: UIWebView){
        indicatorView.stopAnimating()
    }
    //end UIWebViewDelegate
}

