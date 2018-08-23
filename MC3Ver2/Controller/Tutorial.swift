//
//  Tutorial.swift
//  MC3Ver2
//
//  Created by Davin Pratama on 22/08/18.
//  Copyright © 2018 MalasCorp. All rights reserved.
//

import UIKit

class Tutorial: UIViewController, UIPageViewControllerDataSource {
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "backtohome", sender: self)
    }
    
    var pageImages: NSArray!
    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pageImages = NSArray(objects: "tutorialpage","polisipage","wargapage","pencuripage")
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyPageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        var initialContentViewController = self.pageTutorialAtIndex(index: 0) as ContentHolder
        var viewControllers = NSArray(object: initialContentViewController)
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height-100)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageTutorialAtIndex(index: Int) -> ContentHolder
    {
        var pageContentViewController =
            self.storyboard?.instantiateViewController(withIdentifier: "ContentHolder") as! ContentHolder
        
        pageContentViewController.imageFileName = pageImages[index] as! String
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        var viewController = viewController as! ContentHolder
        var index = viewController.pageIndex as Int
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
        }
        index = index - 1
        
        return self.pageTutorialAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        var viewController = viewController as! ContentHolder
        var index = viewController.pageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        index = index + 1
        
        if (index == pageImages.count)
        {
            return nil
        }
        
        return self.pageTutorialAtIndex(index: index)
    }
    
    
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int
    {
        return pageImages.count
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int
    {
        return 0
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
