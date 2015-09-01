//
//  HomeViewController.swift
//  
//
//  Created by zendai on 15/8/3.
//
//

import UIKit

class HomeViewController: UIViewController {

    let ScreenWidth = UIScreen .mainScreen().bounds.width
    let ScreenHeight = UIScreen .mainScreen().bounds.height
    
    var bannerArray:NSArray = []
    var bannerScroll: CycleScrollView = CycleScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path:String = NSBundle .mainBundle() .pathForResource("banner", ofType: "plist")!
        
        bannerArray = NSArray (contentsOfFile: path)!
        
        if bannerArray.count != 0
        {

            self .initBannerWithImage()
        }
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    func initBannerWithImage()
    {
        
        var viewsArray:NSMutableArray = []
        
        bannerScroll = CycleScrollView(frame: CGRectMake(0, 64, ScreenWidth, ScreenWidth*6/13), animationDuration: 3)
        
        bannerScroll.backgroundColor = UIColor .orangeColor()
        
        for (var i = 0; i < bannerArray.count; ++i)
        {
            let  imageDict:NSDictionary = bannerArray[i] as! NSDictionary;
            
            
            var tempImage:UIImageView = UIImageView(frame: CGRectMake(0, 0, ScreenWidth, ScreenWidth*6/13))
            tempImage .sd_setImageWithURL(NSURL(string: imageDict["image"] as! String), placeholderImage: UIImage(named: "activity_01.png"))
            viewsArray .addObject(tempImage)
        }
        
        bannerScroll.fetchContentViewAtIndex = {
            (pageIndex:Int) -> UIView in
            
            
            return viewsArray[pageIndex] as! UIView
        }
        
        bannerScroll.totalPagesCount = {
            
            () -> Int in
            
            return viewsArray.count
            
        }
        
        bannerScroll.TapActionBlock = {
        
            (pageIndex:Int) -> () in
            
            self .tapImageWithIndex(pageIndex)
            
        }
        
        self.view .addSubview(bannerScroll)
        
        
        
    }
    
    func tapImageWithIndex(index:Int)
    {
        var webVC:WebViewController = self.storyboard! .instantiateViewControllerWithIdentifier("webID") as! WebViewController
        webVC.webTitle = (bannerArray[index]["title"] as? String)!
        webVC.webLink = (bannerArray[index]["skip"] as? String)!
        
        self.navigationController! .pushViewController(webVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
