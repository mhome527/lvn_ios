//
//  MainViewController.swift
//  lvn
//
//  Created by admin on 4/24/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let TAG  = "MainViewController"
    var mainImpl:MainImpl!
    
    let ID_STORYBOARD_ALPHABET = "id_storyboard_alphabet"
    let ID_STORYBOARD_NUMBER = "id_storyboard_number"
    let ID_ACTION_WORDS = "id_words"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImpl = MainImpl()
        mainImpl.loadJson()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        Log.print(TAG, msg:"id: \(segue.identifier)")
        
        if (segue.identifier == ID_ACTION_WORDS) {
            var controller = segue.destinationViewController as! WordsViewController;
            controller.type_Kind = sender as! Int

        }else{
            Log.print(TAG, msg:"other form")

        }
        
    }
    
    @IBAction func actionAlphabet(sender: AnyObject) {
        let vc = AlphabetViewController(nibName: ID_STORYBOARD_ALPHABET, bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func actionNumber(sender: AnyObject) {
        let vc = NumberViewController(nibName: ID_STORYBOARD_NUMBER, bundle: nil)
        navigationController?.pushViewController(vc, animated: true)

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
    
    
}


