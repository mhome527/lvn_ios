//
//  AlphabetViewController.swift
//  lvn
//
//  Created by admin on 4/17/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class AlphabetViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var collectionAlphabet: UICollectionView!
    let ID_COLLECTION_CELL = "alphabet_cell"
    var listAlphabet: NSArray!
    var audioPlay: AudioPlayerManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        audioPlay.setFileNameStr(alphabet)
        audioPlay.playSound()
    }
    // end UICollectionViewDataSource
    
}







