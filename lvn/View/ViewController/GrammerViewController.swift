//
//  GrammerViewController.swift
//  lvn
//
//  Created by admin on 8/21/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class GrammerViewController: BaseViewController, UIPageViewControllerDataSource {
    let TAG = "GrammerViewController"
    
    var pageViewController : UIPageViewController?
    var currentIndex : Int = 0
    var countPages: Int = 10
    var listUrl: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrlData()
        
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController!.dataSource = self
        
        let startVC: GrammerContentViewController = viewControllerAtIndex(0)!
        let viewControllers: NSArray = [startVC]

        pageViewController!.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: false, completion: nil)
        pageViewController!.view.frame = CGRectMake(0, 35, view.frame.size.width, view.frame.size.height - 85);
        
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
        
        setupPageControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /// Impl UIPageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! GrammerContentViewController).pageIndex

        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! GrammerContentViewController).pageIndex
        
        if index == NSNotFound {
            return nil
        }
        
        index++
        
        if (index == self.listUrl.count) {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }

    
    /// end UIPageViewControllerDataSource

    func loadUrlData(){
        var urlPath: String
        if lang == "JA" {
            urlPath = NSBundle.mainBundle().pathForResource(Constant.FILENAME_URL_JA, ofType: "plist")!
        }else if lang == "KO" {
            urlPath = NSBundle.mainBundle().pathForResource(Constant.FILENAME_URL_KO, ofType: "plist")!
        }else {
            urlPath = NSBundle.mainBundle().pathForResource(Constant.FILENAME_URL_EN, ofType: "plist")!
        }
        listUrl = NSArray(contentsOfFile: urlPath)
        Log.print(TAG, msg: "list url: \(listUrl.count)")
    }
    
    func viewControllerAtIndex(index: Int) -> GrammerContentViewController?
    {
        if  index >= self.listUrl.count
        {
            return nil
        }
        Log.print(TAG, msg: "=== page:\(index) web: \(listUrl[index])")
        // Create a new view controller and pass suitable data.
//        let pageContentViewController = GrammerContentViewController()
       let pageContentViewController =  self.storyboard!.instantiateViewControllerWithIdentifier(Constant.ID_GRAMMER_CONTENT) as! GrammerContentViewController
        pageContentViewController.urlWeb = listUrl[index] as! String
        pageContentViewController.pageIndex = index
        currentIndex = index
        
        return pageContentViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.listUrl.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }

////
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }
    
}


