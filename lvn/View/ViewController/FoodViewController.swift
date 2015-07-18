//
//  FoodViewController.swift
//  lvn
//
//  Created by admin on 6/29/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, WordsViewDelegate {

    let TAG = "FoodViewController"
    
    var lang:String = "EN"
    let ID_CELL = "food_cell"
    ///
    
    @IBOutlet weak var pageImage: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgShow: UIImageView!
    
    ///
    var wordsImpl: WordsImpl!
    var audioPlay: AudioPlayerManager!
    var listData: [TblVietEx]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlay = AudioPlayerManager()
        wordsImpl = WordsImpl(lang: lang, viewDelegate: self)
        wordsImpl.loadData(3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //impl WordsViewDelegate
    func loadWords(listData: [TblVietEx]){
        Log.print(TAG, msg: "loadWords count: \(listData.count)")
        self.listData = listData
        collectionView.reloadData()
    }
    
    //impl CollectionViewDatasource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return listData.count
    }
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID_CELL, forIndexPath: indexPath) as! FoodViewCell
//        cell.imgFood.image = UIImage(named: pageImages[indexPath.row])
        cell.imgFood.image = UIImage(named: "images/\(listData[indexPath.row].img).png")

        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 1
    }
    
    //end CollectionViewDatasource
    

    // Impl CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        Log.print(TAG, msg: "row selected: \(indexPath.row + 1)")
        imgShow.image =  UIImage(named: "images/\(listData[indexPath.row].img).png")
    }
    // end CollectionViewDelegate
    
    // Impl UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            let width = 100
            let height = width
            
            return CGSize(width: width, height: width);
    }
    /// end UICollectionViewDelegateFlowLayout
}




