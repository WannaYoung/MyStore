//
//  CategoryViewController.swift
//  
//
//  Created by zendai on 15/8/3.
//
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate
{
    
    @IBOutlet weak var categoryTable: UITableView!
    

    
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    var categoryArray:NSArray = []
    var contentArray:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path:String = NSBundle .mainBundle() .pathForResource("category", ofType: "plist")!
        
        categoryArray = NSArray (contentsOfFile: path)!
        
        contentArray = categoryArray[0]["content"] as! NSArray
        
        let indexPath:NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        
        categoryTable .selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool)
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if UIScreen .mainScreen().bounds.size.width == 768
        {
            return 60
        }
        else if UIScreen .mainScreen().bounds.size.height == 480
        {
            return 40
        }
        else
        {
            return 45
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return categoryArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = tableView .dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath) as! UITableViewCell
        
        var selectedView:UIView = UIView(frame: cell.frame)
        
        selectedView.backgroundColor = UIColor.whiteColor()
        
        cell.selectedBackgroundView = selectedView
        
        var titleLabel:UILabel = cell .viewWithTag(11) as! UILabel
        
        let dict:NSDictionary = categoryArray[indexPath.row] as! NSDictionary
        
        titleLabel.text = dict["category"] as? String
        
        if indexPath.row == 0
        {
           titleLabel.textColor = UIColor(red: 0.95, green: 0.3, blue: 0.3, alpha: 1.0)
        }
        
        if UIScreen .mainScreen().bounds.size.width == 768
        {
            titleLabel.font = UIFont .systemFontOfSize(16)
        }

        else if UIScreen .mainScreen().bounds.size.width == 320
        {
            titleLabel.font = UIFont .systemFontOfSize(13)
            
        }
        else
        {
            titleLabel.font = UIFont .systemFontOfSize(15)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var currentCell:UITableViewCell = tableView .cellForRowAtIndexPath(indexPath)!
        
        var titleLabel:UILabel = currentCell .viewWithTag(11) as! UILabel
        
        titleLabel.textColor = UIColor(red: 0.95, green: 0.3, blue: 0.3, alpha: 1.0)
        
        contentArray = categoryArray[indexPath.row]["content"] as! NSArray
        
        categoryCollection .reloadData()
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    {
        var currentCell:UITableViewCell = tableView .cellForRowAtIndexPath(indexPath)!
        
        var titleLabel:UILabel = currentCell .viewWithTag(11) as! UILabel
        
        titleLabel.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerView: CollectionHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView", forIndexPath: indexPath) as! CollectionHeaderView
        
        headerView.headerTitle.text = contentArray[indexPath.section]["category"] as? String
        
        return headerView
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return contentArray.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        let classArray:NSArray = contentArray[section]["content"] as! NSArray
        
        return classArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell:UICollectionViewCell = collectionView .dequeueReusableCellWithReuseIdentifier("itemCell", forIndexPath: indexPath) as! UICollectionViewCell
        
        var titleLabel:UILabel = (cell .viewWithTag(22) as? UILabel)!
        
        let itemArray:NSArray = contentArray[indexPath.section]["content"] as! NSArray
        
        titleLabel.text = itemArray[indexPath.item]["title"] as? String
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        let itemArray:NSArray = contentArray[indexPath.section]["content"] as! NSArray
        
        let categoryName:String = (itemArray[indexPath.item]["title"] as? String)!
        let categoryID:String = (itemArray[indexPath.item]["id"] as? String)!
        
        let classVC:ClassViewController = self.storyboard! .instantiateViewControllerWithIdentifier("classID") as! ClassViewController
        classVC.categoryID = categoryID
        classVC.categoryName = categoryName
        
        self.navigationController! .pushViewController(classVC, animated: true)
        
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
