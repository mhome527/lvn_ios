//
//  WordsViewController.swift
//  lvn
//
//  Created by admin on 4/24/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class WordsViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,  WordsViewDelegate {
    
    let TAG = "WordsViewController"
    var wordsImpl: WordsImpl!
//    var lang:String = "EN"
    var listData: [TblVietEx]!
    let ID_WORD_CELL = "id_word_cell"
    var audioPlay: AudioPlayerManager!
    var type_Kind: Int = 1
    var widthCell:CGFloat!
    var currCell:UICollectionViewCell!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var lblWord: UILabel!
    
    ///////
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var mainImpl:MainImpl = MainImpl()
//        mainImpl.loadJson()
        setWidthCell()
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0)
        
        audioPlay = AudioPlayerManager()
        wordsImpl = WordsImpl(lang: lang, viewDelegate: self)
        wordsImpl.loadData(type_Kind)

        
    }

//    override func viewWillLayoutSubviews(){
//        Log.print(TAG, msg: "viewWillLayoutSubviews")
//
//        collectionVIew.collectionViewLayout.invalidateLayout()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func speakWord(sender: AnyObject) {
        Log.print(TAG, msg: "speak:")
        audioPlay.setFileName(["d1en","d1ie62n","d1u5ng"])
        audioPlay.playSound()
    }
    
    

    //impl WordsViewDelegate
    func loadWords(listData: [TblVietEx]){
        Log.print(TAG, msg: "loadWords count: \(listData.count)")
        self.listData = listData
        lblWord.text = "\(listData[0].viet) : \(listData[0].other)"
        collectionView.reloadData()
//        dispatch_async(dispatch_get_main_queue(), {
//            self.collectionVIew.reloadData
//        })

    }
    
    //impl UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if let lst = listData {
            return listData.count
        }else{
            return 0
        }
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
//        Log.print(TAG, msg: "collection cell....")
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID_WORD_CELL, forIndexPath: indexPath) as! WordViewCell
        
        if indexPath.row == 0 {
            currCell = cell
            currCell?.layer.borderWidth = 2.0
            currCell?.layer.borderColor = UIColor.yellowColor().CGColor

        }
        cell.setData(listData[indexPath.row].img, text: listData[indexPath.row].viet)
        return cell
    
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 1
    }
    
    // Impl UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        let words = listData[indexPath.row].viet
        lblWord.text = "\(listData[indexPath.row].viet) : \(listData[indexPath.row].other)"
        
        //highlight selected cell
        if let cell = currCell {
            currCell?.layer.borderWidth = 0
            currCell?.layer.borderColor = UIColor.clearColor().CGColor
        }
        
        currCell = collectionView.cellForItemAtIndexPath(indexPath)
        currCell?.layer.borderWidth = 2.0
        currCell?.layer.borderColor = UIColor.yellowColor().CGColor
        ////
        
        audioPlay.setFileNameStr(words)
        audioPlay.playSound()
    }
    // end UICollectionViewDataSource

    
    // Impl UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
//             let width = (collectionView.bounds.size.width) / 3 - 7;
//            Log.print(TAG, msg: "resize cell size: \(widthCell)")
           
            let height = widthCell + 10;

            return CGSize(width: widthCell, height: height);
    }
    /// end UICollectionViewDelegateFlowLayout
    
    @IBAction func tappedSpeak(sender: AnyObject) {
        audioPlay.setFileNameStr(lblWord.text!)
        audioPlay.playSound()
    }
    
    ////////
    
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
        Log.print(TAG, msg: "resize cell size: \(collectionView.bounds.size.width) : \(widthCell)")

    }

    
}

