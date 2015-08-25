//
//  SearchViewController.swift
//  lvn
//
//  Created by admin on 7/12/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController , UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate,  PhrasesViewDelegate, UITextFieldDelegate {
    
    let TAG = "PhrasesViewController"
    var phrasesImp: PhrasesImpl!
//    let lang = "EN"
    var listData: [TblVietEx]!
    var filteredData = [TblVietEx]()
    var audioPlay: AudioPlayerManager!
    
    var searchImpl: SearchImpl!
    
    
    @IBOutlet weak var tableSearch: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableSearch.backgroundColor = UIColor.clearColor()
        searchImpl = SearchImpl(lang: lang, viewDelegate: self)
        searchImpl.loadData()
        
//        tableSearch.estimatedRowHeight = 150.0
//        tableSearch.rowHeight = UITableViewAutomaticDimension

        
        audioPlay = AudioPlayerManager()
        
        let b = isLandscapeOrientation()
        

        Log.print(TAG, msg: "Orientation: \(b)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //implement PhrasesViewDelegate
    func loadPhrases(listData: [TblVietEx]) {
        Log.print(TAG, msg: "loadPhrase size:\(listData.count)" )
        self.listData = listData
        tableSearch.reloadData()
//        indicatorView.stopAnimating()
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
        var cell: SearchViewCell = tableSearch.dequeueReusableCellWithIdentifier(Constant.ID_SEARCH_CELL, forIndexPath: indexPath) as! SearchViewCell
        var entity:TblVietEx
        if (tableView == self.searchDisplayController?.searchResultsTableView)
        {
            entity = self.filteredData[indexPath.row]
        }
        else
        {
            entity = self.listData[indexPath.row]
        }

      
       
        cell.setData(entity)
      
        cell.backgroundColor = UIColor.clearColor()
//        tableSearch.rowHeight = 160
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
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 80
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
    
//    func searchDisplayController(controller: UISearchDisplayController, didLoadSearchResultsTableView tableView: UITableView)
//    {
//        tableSearch.rowHeight = 100
//    }
    // end UISearchDisplayDelegate
    
    func filterContenctsForSearchText(searchText: String, scope: String = "All")
    {
        
//        Log.print(TAG, msg: "filterContenctsForSearchText 2, text: \(searchText)")
        self.filteredData = self.listData.filter({( tblViet : TblVietEx) -> Bool in
            
            var categoryMatch = (scope == "All")
            var search = searchText.lowercaseString.stringByReplacingOccurrencesOfString("đ", withString: "d")

            var text1 = tblViet.viet.stringByFoldingWithOptions(NSStringCompareOptions.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
            var text2 = tblViet.other.stringByFoldingWithOptions(NSStringCompareOptions.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
            text1 = text1.lowercaseString.stringByReplacingOccurrencesOfString("đ", withString: "d")
            
            if tblViet.kind == 11 {
            
                text1 = text1.stringByReplacingOccurrencesOfString("\u{1}", withString: "").stringByReplacingOccurrencesOfString("\u{2}", withString: "").stringByReplacingOccurrencesOfString("\u{3}", withString: "").stringByReplacingOccurrencesOfString("\u{4}", withString: "")
    
                text2 = text2.lowercaseString.stringByReplacingOccurrencesOfString("\u{1}", withString: "").stringByReplacingOccurrencesOfString("\u{2}", withString: "").stringByReplacingOccurrencesOfString("\u{3}", withString: "").stringByReplacingOccurrencesOfString("\u{4}", withString: "")

            }
            

            var stringMatch = text1.rangeOfString(search)
            var stringMatch2 = text2.rangeOfString(search)

            
            var b = categoryMatch && ((stringMatch != nil) || (stringMatch2 != nil))

            return b
            
        })
    }
    
    func isLandscapeOrientation() -> Bool {
        return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)
    }
    

}
