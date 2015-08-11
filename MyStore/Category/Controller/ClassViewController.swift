//
//  ClassViewController.swift
//  MyStore
//
//  Created by Yang on 15/8/10.
//  Copyright (c) 2015年 zendai. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController
{
    var categoryID:String = ""
    var categoryName:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = categoryName
        println(categoryID+categoryName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
