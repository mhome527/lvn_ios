//
//  FoodViewController.swift
//  lvn
//
//  Created by admin on 6/29/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class FoodViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, WordsViewDelegate {

    let TAG = "FoodViewController"
    
//    var lang:String = "EN"
    let ID_CELL = "food_cell"
    ///
    
//    @IBOutlet weak var pageImage: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgShow: UIImageView!
    
    @IBOutlet weak var lblFood: UILabel!
    ///
    var wordsImpl: WordsImpl!
    var audioPlay: AudioPlayerManager!
    var listData: [TblVietEx]!
    var currCell:UICollectionViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0.0)

        audioPlay = AudioPlayerManager()
        wordsImpl = WordsImpl(lang: lang, viewDelegate: self)
        wordsImpl.loadData(3)
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 90, height: 90)
//        setConstrainsView()
        
        resizeImage(imgShow.image!);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //impl WordsViewDelegate
    func loadWords(listData: [TblVietEx]){
        Log.print(TAG, msg: "loadWords count: \(listData.count)")
        
        self.listData = listData
        
        let item = listData[0]
        lblFood.text = item.viet
        imgShow.image = UIImage(named: "images/f_\(item.img)_l.png")
        
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
        if indexPath.row == 0 {
            currCell = cell
            cell.layer.borderWidth = 2.0
            cell.layer.borderColor = UIColor.yellowColor().CGColor

        }
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 1
    }
    
    //end CollectionViewDatasource
    

    // Impl CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        Log.print(TAG, msg: "row selected: \(indexPath.row + 1)")
        let item = listData[indexPath.row];
        imgShow.image =  UIImage(named: "images/f_\(listData[indexPath.row].img)_l.png")
        lblFood.text = item.viet
        
        //highlight selected cell
        if let cell = currCell {
            currCell?.layer.borderWidth = 0
            currCell?.layer.borderColor = UIColor.clearColor().CGColor
        }
        
        currCell = collectionView.cellForItemAtIndexPath(indexPath)
        currCell?.layer.borderWidth = 2.0
        currCell?.layer.borderColor = UIColor.yellowColor().CGColor
        ////
    }
    // end CollectionViewDelegate
    
    // Impl UICollectionViewDelegateFlowLayout
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//            let width = 100
//            let height = width
//            
//            return CGSize(width: width, height: width);
//    }
    /// end UICollectionViewDelegateFlowLayout
    
    @IBAction func eventSound(sender: AnyObject) {
        audioPlay.setFileNameStr(lblFood.text!)
        audioPlay.playSound()
    }
    
    ////
    func setConstrainsView(){
        var constH:NSLayoutConstraint = NSLayoutConstraint(item: imgShow, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: imgShow, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 200);

       imgShow.addConstraint(constH)
        
    }
    
    func resizeImage(image: UIImage) -> UIImage {
        
//        let scale = newHeight / image.size.height
        let newWidth = image.size.width - 8
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newWidth))
        image.drawInRect(CGRectMake(4, 0, newWidth, newWidth))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}





