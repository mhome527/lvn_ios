//
//  GrammerContentViewController.swift
//  lvn
//
//  Created by admin on 8/21/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class GrammerContentViewController: UIViewController, UIWebViewDelegate {

    let TAG = "GrammerContantViewController"
//    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var webview: UIWebView!
    var pageIndex: Int = 0
    var urlWeb: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log.print(TAG, msg: "urlWeb:\(urlWeb)")
//        // Do any additional setup after loading the view.
//        
//        if urlWeb == "en1" {
//            view.backgroundColor = UIColor.blueColor()
//        }else {
//            view.backgroundColor = UIColor.greenColor()
//        }
//        
////        view.backgroundColor = UIColor(patternImage: UIImage(named: imageFile)!)
//        
//        let label = UILabel(frame: CGRectMake(0, 0, view.frame.width, 200))
//        label.textColor = UIColor.whiteColor()
//        label.text = urlWeb
//        label.textAlignment = .Center
//        view.addSubview(label)
//        
//        let button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
//        button.frame = CGRectMake(20, view.frame.height - 110, view.frame.width - 40, 50)
//        button.backgroundColor = UIColor(red: 138/255.0, green: 181/255.0, blue: 91/255.0, alpha: 1)
//        button.setTitle(urlWeb, forState: UIControlState.Normal)
//        button.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(button)
        
//        let localfilePath = NSBundle.mainBundle().URLForResource(urlWeb, withExtension: "html");
//        let myRequest = NSURLRequest(URL: localfilePath!);
//        webview.loadRequest(myRequest);
//        
//        var try6 = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource(urlWeb, ofType:"html")!)
//        var request = NSURLRequest(URL: try6!);
//        self.webview.loadRequest(request)

        webview.delegate = self
        let html = NSBundle.mainBundle().pathForResource("\(urlWeb).html", ofType: "", inDirectory: "")
        let url = NSURL.fileURLWithPath(html!) // The html cannot be nil.
        let request = NSURLRequest(URL: url!) // The URL cannot be nil too.

        self.webview.loadRequest(request)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Impl UIWebViewDelegate
    func webViewDidFinishLoad(webView: UIWebView){
        Log.print(TAG, msg: "web finish load")
        var textFontSizeTemp:Int = 18
        var jsString = "document.getElementsByTagName('body')[0].style.fontSize='\(textFontSizeTemp)px'"
        webView.stringByEvaluatingJavaScriptFromString(jsString)

    }
    //end UIWebViewDelegate


}
