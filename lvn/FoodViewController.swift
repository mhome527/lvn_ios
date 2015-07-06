//
//  FoodViewController.swift
//  lvn
//
//  Created by admin on 6/29/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, WordsViewDelegate {

    let TAG = "FoodViewController"
    var pageImages:[String] = []
    
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
        
        pageImages = ["images/apple.png", "images/beer.png", "images/bear.png", "images/bee.png","images/boat.png"]
        
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
        return pageImages.count
    }
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID_CELL, forIndexPath: indexPath) as! FoodViewCell
        cell.imgFood.image = UIImage(named: pageImages[indexPath.row])
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 1
    }
    
    //end CollectionViewDatasource
    

    // Impl CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        Log.print(TAG, msg: "row selected: \(indexPath.row + 1)")
        imgShow.image = UIImage(named: pageImages[indexPath.row])
    }
    
    // end CollectionViewDelegate
   
}





