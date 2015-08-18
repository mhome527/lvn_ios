//
//  BaseViewController.swift
//  lvn
//
//  Created by admin on 8/13/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var delegateView: BaseViewDelegate!
    var lang:String = "EN"
    var color_type = "blue" //1: blue; 2: pink; 3: green
    var gradient: CAGradientLayer!
    
    override func viewDidLoad() {
//        super.viewDidLoad()
        
        if let langTmp: AnyObject = Utility.getObj(Constant.KEY_LANGUAGE) {
            lang = langTmp as! String
        }
        
        Log.print("BaseView", msg: "lang: \(lang)")
        if let color: AnyObject = Utility.getObj(Constant.KEY_COLOR){
            color_type = color as! String
        }
        chaneBackground()

        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadBaseView(delegateView: BaseViewDelegate) {
        self.delegateView = delegateView;
    }

    func chaneBackground(){
        
        createGradient(view: self.view)
    }
    
    func createGradient(view aView: UIView) {
//        aView.backgroundColor = UIColor.clearColor()
        
        if let tmp = gradient {
            
        }
        else{
            gradient = CAGradientLayer()
            aView.layer.insertSublayer(gradient, atIndex:0)
        }
        
        gradient.frame = CGRectMake(0.0, 0.0, aView.frame.size.width, aView.frame.size.height)


        if color_type == "green" {
             gradient.colors = [UIColor(red: 0.0/255.0, green: 255.0/255.0, blue:   0.0/255.0, alpha: 0.3).CGColor, UIColor(red: 0.0/255.0, green: 0.0/255.0,   blue: 0.0/255.0, alpha: 1.0).CGColor]
        }
        else if color_type == "blue" {
             gradient.colors = [UIColor(red: 0.0/255.0, green: 50.0/255.0, blue:   250.0/255.0, alpha: 0.3).CGColor, UIColor(red: 0.0/255.0, green: 0.0/255.0,   blue: 0.0/255.0, alpha: 1.0).CGColor]
        }
        else{
             gradient.colors = [UIColor(red: 200.0/255.0, green: 10.0/255.0, blue:   0.0/255.0, alpha: 0.3).CGColor, UIColor(red: 0.0/255.0, green: 0.0/255.0,   blue: 0.0/255.0, alpha: 1.0).CGColor]
        }
        
//        gradient.colors = [UIColor(red: 0.0/255.0, green: 255.0/255.0, blue:   0.0/255.0, alpha: 0.0).CGColor, UIColor(red: 0.0/255.0, green: 0.0/255.0,   blue: 0.0/255.0, alpha: 1.0).CGColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        
//        aView.layer.insertSublayer(gradient, atIndex:0)
    }
}
