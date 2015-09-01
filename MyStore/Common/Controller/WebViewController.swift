//
//  WebViewController.swift
//  MyStore
//
//  Created by Yang on 15/8/13.
//  Copyright (c) 2015年 Yang. All rights reserved.
//

import UIKit

class WebViewController: UIViewController{
    
    let ScreenWidth = UIScreen .mainScreen().bounds.width
    let ScreenHeight = UIScreen .mainScreen().bounds.height
    
    var webTitle:String = ""
    var webLink:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self .initMyWebView()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    func initMyWebView()
    {
        self.title = webTitle
        
        var toolView:UIView = UIView(frame: CGRectMake(0, ScreenHeight-ScreenWidth/10, ScreenWidth, ScreenWidth/10))
        var backImage:UIImageView = UIImageView(frame: CGRectMake(0, 0, toolView.frame.size.width, toolView.frame.size.height))
        backImage.image = UIImage(named: "web_bg.png")
        toolView .addSubview(backImage)
        
        for(var i:Int = 0 ;i<4 ;i++)
        {
            var x:CGFloat = toolView.frame.size.width/4*CGFloat(i)
            
           var webButton:UIButton = UIButton(frame: CGRectMake(x, 0, toolView.frame.size.width/4, toolView.frame.size.height))
            
            var imageName:String = "web_bt\(i+1).png"
            webButton .setImage(UIImage(named: imageName), forState: UIControlState.Normal)
            
            toolView .addSubview(webButton)
        }
        
        
        
        self.view .addSubview(toolView)
    }
    

}
