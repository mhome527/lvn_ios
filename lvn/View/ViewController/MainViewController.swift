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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// create and insert table
        if Constant.IS_CREATE_DB == true {
            let mainImpl = MainImpl()
            mainImpl.loadJson()
        }
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
    
    
//    @IBAction func actionAlphabet(sender: AnyObject) {
//        let vc = AlphabetViewController(nibName: ID_STORYBOARD_ALPHABET, bundle: nil)
//        navigationController?.pushViewController(vc, animated: true)
//    }
//    
//    
//    @IBAction func actionNumber(sender: AnyObject) {
//        let vc = NumberViewController(nibName: ID_STORYBOARD_NUMBER, bundle: nil)
//        navigationController?.pushViewController(vc, animated: true)
//
//    }
    
    
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
    
    /////// Impl UIActionSheetDelegate
//    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int){
//        if( buttonIndex == 2){
//            self.lang = "JA"
//             println("Ja")
//        }
//        if( buttonIndex == 3){
//            self.lang = "KO"
//             println("Ko")
//        }
//        if( buttonIndex == 4){
//            self.lang = "FR"
//            println("Fr")
//        }
//        if( buttonIndex == 5){
//            self.lang = "RU"
//             println("Ru")
//        }
//        else{
//            self.lang = "EN"
//             println("E")
//        }
//    }
    /////// end UIActionSheetDelegate
    
    func showDialogIOS8(){
        let optionMenu = UIAlertController(title: nil, message: "Language", preferredStyle: .ActionSheet)
        
        
//        optionMenu.popoverPresentationController!.sourceView = self.view
//        optionMenu.popoverPresentationController!.sourceRect = CGRectMake(self.view.bounds.size.width, self.view.bounds.size.height, 1.0, 1.0)
        if let popover = optionMenu.popoverPresentationController {
            popover.sourceView = self.view
            popover.sourceRect = CGRectMake(self.view.bounds.size.width, self.view.bounds.size.height, 1.0, 1.0)
        }
//        optionMenu.popoverPresentationController!.sourceView = self.view
//        optionMenu.popoverPresentationController!.sourceRect = CGRectMake(self.view.bounds.size.width, self.view.bounds.size.height, 1.0, 1.0)
        // this is the center of the screen currently but it can be any point in the view
        
//        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        
//               popOver?.permittedArrowDirections = UIPopoverArrowDirection.Any
        
        
        /////////
        let optionVE = UIAlertAction(title: "V-E", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
             self.lang = "EN"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)

             Log.print(self.TAG, msg:"E")
            
        })
        
        let optionVJ = UIAlertAction(title: "V-J", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            Log.print(self.TAG, msg:"J")
            self.lang = "JA"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)

        })
        
        let optionVK = UIAlertAction(title: "V-K", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("K")
            self.lang = "KO"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)

        })
        
        let optionVF = UIAlertAction(title: "V-F", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("F")
            self.lang = "FR"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
        })
        
        let optionVR = UIAlertAction(title: "V-R", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("R")
            self.lang = "VR"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
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
        var observerObject: NSObjectProtocol?
        let alertController = BPCompatibleAlertController(title: nil, message: "Language", alertStyle: BPCompatibleAlertControllerStyle.Alert)
        alertController.postActionHandlerCleanupFunction =  {
            if (observerObject != nil)
            {
                NSNotificationCenter.defaultCenter().removeObserver(observerObject!)
                observerObject = nil
            }
        }
        
        let actionJa = BPCompatibleAlertAction.defaultActionWithTitle("JA", handler: { (action) in
            self.lang = "JA"
            Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            Log.print(self.TAG, msg:"JA")
        })
        
        let actionKo = BPCompatibleAlertAction.defaultActionWithTitle("KO", handler: { (action) in
            self.lang = "KO"
             Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            Log.print(self.TAG, msg:"KO")
        })
        
        let actionFr = BPCompatibleAlertAction.defaultActionWithTitle("FR", handler: { (action) in
            self.lang = "FR"
             Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            Log.print(self.TAG, msg:"FR")
        })
        
        let actionRu = BPCompatibleAlertAction.defaultActionWithTitle("RU", handler: { (action) in
            self.lang = "RU"
             Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
            Log.print(self.TAG, msg:"RU")
        })
       
        let actionDefault = BPCompatibleAlertAction.defaultActionWithTitle("EN", handler: { (action) in
            self.lang = "EN"
             Utility.saveObj(Constant.KEY_LANGUAGE, entity: self.lang)
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

  }


