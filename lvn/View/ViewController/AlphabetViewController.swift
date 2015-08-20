//
//  AlphabetViewController.swift
//  lvn
//
//  Created by admin on 4/17/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class AlphabetViewController: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var collectionAlphabet: UICollectionView!
    let ID_COLLECTION_CELL = "alphabet_cell"
    var listAlphabet: NSArray!
    var audioPlay: AudioPlayerManager!
    var currCell:UICollectionViewCell!
    var widthCell:CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWidthCell()
        
        collectionAlphabet.backgroundColor = UIColor(white: 1, alpha: 0)

        // Do any additional setup after loading the view.
        loadAlphabetData()
        audioPlay = AudioPlayerManager()
//        collectionAlphabet.backgroundColor = UIColor(white: 1, alpha: 0.3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return listAlphabet.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID_COLLECTION_CELL, forIndexPath: indexPath) as! AlphabetViewCell
        let alphabet = listAlphabet[indexPath.row] as! String
        cell.setData(alphabet)
        
         //highlight cell
        if indexPath.row == 0 {
            currCell = cell
            currCell?.layer.borderWidth = 2.0
            currCell?.layer.borderColor = UIColor.yellowColor().CGColor
            
        }
//        cell.backgroundColor = UIColor(white: 1, alpha: 0.3)

        return cell
    }
    
    func loadAlphabetData(){
        let alphabetPath = NSBundle.mainBundle().pathForResource(Constant.FILENAME_ALPHABET, ofType: "plist")
        
        listAlphabet = NSArray(contentsOfFile: alphabetPath!)
//                for  data in listAlphabet  {
//                    println("count: \(data)" )
//                }
    }

    // Impl UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        let alphabet = listAlphabet[indexPath.row] as! String
        
        //highlight selected cell
        if let cell = currCell {
            currCell?.layer.borderWidth = 0
            currCell?.layer.borderColor = UIColor.clearColor().CGColor
        }
        
        currCell = collectionView.cellForItemAtIndexPath(indexPath)
        currCell?.layer.borderWidth = 2.0
        currCell?.layer.borderColor = UIColor.yellowColor().CGColor
        ////
        
        
        audioPlay.setFileNameStr(alphabet)
        audioPlay.playSound()
    }
    // end UICollectionViewDataSource
    
    // Impl UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
        return CGSize(width: widthCell, height: widthCell);
    }
    /// end UICollectionViewDelegateFlowLayout
    
    
    func setWidthCell(){
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad)
        {
            // Ipad
            widthCell = (self.view.bounds.size.width) / 5 - 10;
        }
        else
        {
            // Iphone
            widthCell = (self.view.bounds.size.width) / 3 - 7;
        }
        
    }

}







