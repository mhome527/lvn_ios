//
//  MainViewController.swift
//  lvn
//
//  Created by admin on 4/24/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController{
//    , UIActionSheetDelegate 

    let TAG  = "MainViewController"
//    var mainImpl:MainImpl!
    
    let ID_STORYBOARD_ALPHABET = "id_storyboard_alphabet"
    let ID_STORYBOARD_NUMBER = "id_storyboard_number"
    let ID_ACTION_WORDS = "id_words"
    let ID_ACTION_TRANSLATE = "id_translate"

    @IBOutlet weak var imgFlag: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// create and insert table (not release)
        if Constant.IS_CREATE_DB == true {
            let mainImpl = MainImpl()
            mainImpl.loadJson()
            mainImpl.loadRecJson()
        }
         setFlagImage()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        Log.print(TAG, msg:"id: \(segue.identifier)")
        
        if (segue.identifier == ID_ACTION_WORDS) {
            var controller = segue.destinationViewController as! WordsViewController;
            controller.type_Kind = sender as! Int

        }else{
            Log.print(TAG, msg:"other form")
        }
        
    }
    
    @IBAction func changeColorBg(sender: AnyObject) {
        if color_type == "blue" {
            color_type = "pink"
        }
        else if color_type == "pink" {
            color_type = "green"
        }
        else{
            color_type = "blue"
        }
        
        Utility.saveObj(Constant.KEY_COLOR, entity: color_type)

        chaneBackground()
       
    }
    
    
    @IBAction func actionAnimal(sender: AnyObject) {
        self.performSegueWithIdentifier(ID_ACTION_WORDS, sender: 4)
        Log.print(TAG, msg:"actionAnimal")

    }
    
    
   
    @IBAction func actionFruit(sender: AnyObject) {
        self.performSegueWithIdentifier(ID_ACTION_WORDS, sender: 2)
        Log.print(TAG, msg:"actionFruit")

    }
    
    
    @IBAction func actionOther(sender: AnyObject) {
        self.performSegueWithIdentifier(ID_ACTION_WORDS, sender: 5)
        Log.print(TAG, msg:"actionOther")

    }
    

    @IBAction func actionSetting(sender: AnyObject) {
        if Utility.controllerAvailable("UIAlertController"){
            showDialogIOS8()
        }else{
            showDialogIOS7()
        }
        
    }

    
    func showDialogIOS8(){
        let optionMenu = UIAlertController(title: nil, message: "Language", preferredStyle: .ActionSheet)

        if let popover = optionMenu.popoverPresentationController {
            popover.sourceView = self.view
            popover.sourceRect = CGRectMake(self.view.bounds.size.width, self.view.bounds.size.height, 1.0, 1.0)
        }

        var VE:String = "Vietnamese - English"
        var VJ:String = "ベトナム語 - 日本語"
        var VK:String = "베트남의 - 한국어"
        var VF:String = "Vietnamien - français"
        var VR:String = "вьетнамцы - русский"

        
        if lang == "JA" {
            VJ = "\(VJ) (*)"
        }else if lang == "KO" {
            VK = "\(VK) (*)"
        }else if lang == "FR" {
            VF = "\(VF) (*)"
        }else if lang == "RU" {
            VR = "\(VR) (*)"
        }else {
            VE = "\(VE) (*)"
        }
        
        /////////
        let optionVE = UIAlertAction(title: VE, style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.lang = "EN"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            self.setFlagImage()
            Log.print(self.TAG, msg:"E")
            
        })
        
        let optionVJ = UIAlertAction(title: VJ, style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            Log.print(self.TAG, msg:"J")
            self.lang = "JA"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            self.setFlagImage()
        })
        
        let optionVK = UIAlertAction(title: VK, style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("K")
            self.lang = "KO"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
             self.setFlagImage()
        })
        
        let optionVF = UIAlertAction(title: VF, style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("F")
            self.lang = "FR"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
             self.setFlagImage()
        })
        
        let optionVR = UIAlertAction(title: VR, style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("R")
            self.lang = "RU"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
             self.setFlagImage()
        })
        
        let optionCancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Cancel")
            
        })
        
        // 4
        optionMenu.addAction(optionVE)
        optionMenu.addAction(optionVJ)
        optionMenu.addAction(optionVK)
        optionMenu.addAction(optionVF)
        optionMenu.addAction(optionVR)
        optionMenu.addAction(optionCancel)
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }

    func showDialogIOS7(){
        
        var VE:String = "Vietnamese - English"
        var VJ:String = "ベトナム語 - 日本語"
        var VK:String = "베트남의 - 한국어"
        var VF:String = "Vietnamien - français"
        var VR:String = "вьетнамцы - русский"
        
        
        if lang == "JA" {
            VJ = "\(VJ) (*)"
        }else if lang == "KO" {
            VK = "\(VK) (*)"
        }else if lang == "FR" {
            VF = "\(VF) (*)"
        }else if lang == "RU" {
            VR = "\(VR) (*)"
        }else {
            VE = "\(VE) (*)"
        }

        
        var observerObject: NSObjectProtocol?
        let alertController = BPCompatibleAlertController(title: nil, message: "Language", alertStyle: BPCompatibleAlertControllerStyle.Alert)
        alertController.postActionHandlerCleanupFunction =  {
            if (observerObject != nil)
            {
                NSNotificationCenter.defaultCenter().removeObserver(observerObject!)
                observerObject = nil
            }
        }
        
        let actionJa = BPCompatibleAlertAction.defaultActionWithTitle(VJ, handler: { (action) in
            self.lang = "JA"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            self.setFlagImage()
            Log.print(self.TAG, msg:"JA")
        })
        
        let actionKo = BPCompatibleAlertAction.defaultActionWithTitle(VK, handler: { (action) in
            self.lang = "KO"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            self.setFlagImage()
            Log.print(self.TAG, msg:"KO")
        })
        
        let actionFr = BPCompatibleAlertAction.defaultActionWithTitle(VF, handler: { (action) in
            self.lang = "FR"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            self.setFlagImage()
            Log.print(self.TAG, msg:"FR")
        })
        
        let actionRu = BPCompatibleAlertAction.defaultActionWithTitle(VR, handler: { (action) in
            self.lang = "RU"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            self.setFlagImage()
            Log.print(self.TAG, msg:"RU")
        })
       
        let actionDefault = BPCompatibleAlertAction.defaultActionWithTitle(VE, handler: { (action) in
            self.lang = "EN"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            self.setFlagImage()
            Log.print(self.TAG, msg:"EN")
        })

        
        alertController.addAction(actionJa)
        alertController.addAction(actionKo)
        alertController.addAction(actionFr)
        alertController.addAction(actionRu)
        alertController.addAction(actionDefault)

        
        
        alertController.addAction(BPCompatibleAlertAction.cancelActionWithTitle("Cancel", handler: { (action) in
            Log.print(self.TAG, msg:"Cancel")
        }))
        
        alertController.presentFrom(self.navigationController, animated: true) { () in
            // Completion handler
        }

    }
    
    func setFlagImage(){
        if self.lang == "JA" {
            imgFlag.image = UIImage(named: "japan")
        }else if self.lang == "KO" {
            imgFlag.image = UIImage(named: "korea")
        }else if self.lang == "FR" {
            imgFlag.image = UIImage(named: "france")
        }else if self.lang == "RU" {
            imgFlag.image = UIImage(named: "russia")
        }else{
            imgFlag.image = UIImage(named: "english")
        }
    }

  }


