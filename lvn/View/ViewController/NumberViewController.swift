//
//  NumberViewController.swift
//  lvn
//
//  Created by admin on 4/24/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class NumberViewController: BaseViewController , UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITextFieldDelegate {
    
    let TAG = "NumberViewController"
    
    var audioPlay: AudioPlayerManager!
    
    //controll
    @IBOutlet var collectionNumber: UICollectionView!
  
    @IBOutlet weak var edtText: UITextField!{ didSet { edtText.delegate = self } }
    @IBOutlet var lblText: UILabel!
    
    
    /////
    let ID_COLLECTION_CELL = "number_cell"
    var listNumber: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadNumberData()
        collectionNumber.backgroundColor = UIColor(white: 1, alpha: 0.0)

        edtText.delegate = self
        edtText.addTarget(self, action:"edtTextNumberChanged:", forControlEvents:UIControlEvents.EditingChanged)
        audioPlay = AudioPlayerManager()
        
        //resize collectionView
        if let layout = collectionNumber.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemWidth = (collectionNumber.bounds.width - 30) / 3.0
            let itemHeight = layout.itemSize.height
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.invalidateLayout()
        }
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func edtTextNumberChanged(textField: UITextField) {
        Log.print(TAG, msg: "edtTextNumberChanged: \(textField.text)")
        
        let str = edtText.text as NSString
        if edtText.text.isEmpty{
            lblText.text = ""
        }else{
            lblText.text = NumberText.convertNumberToChar(str.longLongValue)
        }
    }
    
    
    
//    func setTextNumber(){
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
//            let str = self.edtText.text
//            self.lblText.text = NumberText.convertNumberToChar(str.toInt()!)
//            Log.print(self.TAG, msg: "text: \(self.edtText.text)")
//
//        })
//
//    }
    
    //////

    
    
    //////
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return listNumber.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID_COLLECTION_CELL, forIndexPath: indexPath) as! NumberViewCell
        let number = listNumber[indexPath.row] as! NSString
        let numberText = NumberText.convertNumberToChar(number.longLongValue)
        cell.setData(number as String, numberText: numberText)
        //        cell.backgroundColor = UIColor(white: 1, alpha: 0.3)

        return cell
    }
    
    
    // Impl CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        Log.print(TAG, msg: "row selected: \(listNumber[indexPath.row])")
        let strNumber = listNumber[indexPath.row] as! NSString
        edtText.text = strNumber as String
        
        let textNumber = NumberText.convertNumberToChar(strNumber.longLongValue)
        if !textNumber.isEmpty && textNumber != "" {
            lblText.text = textNumber

            audioPlay.setFileNameStr(textNumber)
            audioPlay.playSound()
        }else{
            Log.print(TAG, msg: "convert number error, text: \(textNumber)")

        }
        
        view.endEditing(true)
    }
    
    // end CollectionViewDelegate
    
    //action
    
    @IBAction func tapSound(sender: AnyObject) {
        let textNumber = lblText.text
        if !textNumber!.isEmpty && textNumber != "" {
            audioPlay.setFileNameStr(textNumber!)
            audioPlay.playSound()
        }else{
            Log.print(TAG, msg: "convert number error, text: \(textNumber)")
            
        }

    }
    
    
    ///////
    
    func loadNumberData(){
        let alphabetPath = NSBundle.mainBundle().pathForResource(Constant.FILENAME_NUMBER, ofType: "plist")
        listNumber = NSArray(contentsOfFile: alphabetPath!)
        //        for  data in listAlphabet  {
        //            println("count: \(data)" )
        //        }
        
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
//         edtText.resignFirstResponder()
//        collectionNumber.resignFirstResponder()
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

}
