//
//  PhrasesViewController.swift
//  lvn
//
//  Created by admin on 5/2/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class PhrasesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate,  PhrasesViewDelegate {

    let TAG = "PhrasesViewController"
    var phrasesImp: PhrasesImpl!
    let lang = "EN"
    var listData: [TblVietEx]!
    var filteredData = [TblVietEx]()
    var audioPlay: AudioPlayerManager!

    
//    @IBOutlet var tablePhrase: UITableView!
    
    @IBOutlet var tablePhrase: UITableView!
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    
    //////
    
    enum ContryName1 : String {
        case EN = "EN"
        case JA = "JA"
        case KO = "KO"
        case FR = "FR"
        case RU = "RU"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        testData()
        indicatorView.startAnimating()
//        var mainImpl:MainImpl = MainImpl()
//        mainImpl.loadJson()
        
        phrasesImp = PhrasesImpl(lang: lang, viewDelegate: self)
        phrasesImp.loadData()
        
        audioPlay = AudioPlayerManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func testData(){
//        let test = "<font color=\"green\"> Tôi</font> có thể <font color=\"blue\">giúp</font> bạn không?"
//        let attrViet = NSAttributedString(
//            data: test.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
//            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
//            documentAttributes: nil,
//            error: nil)
//        Log.print(TAG, msg: "\(attrViet)")
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //implement PhrasesViewDelegate
    func loadPhrases(listData: [TblVietEx]) {
        Log.print(TAG, msg: "loadPhrase size:\(listData.count)" )
        self.listData = listData
        tablePhrase.reloadData()
        indicatorView.stopAnimating()
    }

    /// tableview
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if listData == nil {
             Log.print(TAG, msg: "row = 0")
            return 0
        }
        
//        else{
//             Log.print(TAG, msg: "row = \(listData.count)")
//            return listData.count
//        }
        
        if (tableView == self.searchDisplayController?.searchResultsTableView)
        {
            return self.filteredData.count
        }
        else
        {
            return self.listData.count
        }

    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell: PhrasesViewCell = tablePhrase.dequeueReusableCellWithIdentifier(Constant.ID_PHRASES_CELL, forIndexPath: indexPath) as! PhrasesViewCell
        var entity:TblVietEx
        if (tableView == self.searchDisplayController?.searchResultsTableView)
        {
            entity = self.filteredData[indexPath.row]
        }
        else
        {
            entity = self.listData[indexPath.row]
        }
//        let entity = listData[indexPath.row]
//        cell.setView(entity.viet, ot: entity.other)
        cell.setAttrView(entity.arrViet, ot: entity.arrOther)

        return cell
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath){
//        indicatorView.stopAnimating()
//        Log.print(self.TAG, msg: "tableview willDisplayCell")
    }

    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        var vn:String = self.listData[indexPath.row].viet
        vn = vn.stringByReplacingOccurrencesOfString("\u{1}", withString: "").stringByReplacingOccurrencesOfString("\u{2}", withString: "").stringByReplacingOccurrencesOfString("\u{3}", withString: "").stringByReplacingOccurrencesOfString("\u{4}", withString: "")
        
        vn = vn.stringByReplacingOccurrencesOfString("?", withString: "").stringByReplacingOccurrencesOfString("!", withString: "").stringByReplacingOccurrencesOfString(".", withString: "")
        audioPlay.setFileNameStr(vn)
        audioPlay.playSound()

    }
    
    //// end
    
    // impl UISearchDisplayDelegate
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool
    {
        Log.print(TAG, msg: "searchDisplayController 1, string: \(searchString)")
        self.filterContenctsForSearchText(searchString, scope: "All")
        
        return true
        
    }
    
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool
    {
        Log.print(TAG, msg: "searchDisplayController 2, option: \(searchOption)")

        self.filterContenctsForSearchText(self.searchDisplayController!.searchBar.text, scope: "All")
        
        return true
        
    }
    // end UISearchDisplayDelegate
    
    func filterContenctsForSearchText(searchText: String, scope: String = "All")
    {
        
        Log.print(TAG, msg: "filterContenctsForSearchText 2, text: \(searchText)")
        self.filteredData = self.listData.filter({( tblViet : TblVietEx) -> Bool in
            

            var categoryMatch = (scope == "All")
            var stringMatch = tblViet.other.rangeOfString(searchText)
            var b = categoryMatch && (stringMatch != nil)
//            Log.print("filter", msg: "other check= \(b); value: \(tblViet.other)")
//            return categoryMatch && (stringMatch != nil)
            return b
            
        })
        
        
    }

}
