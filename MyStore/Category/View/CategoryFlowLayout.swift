//
//  CategoryFlowLayout.swift
//  MyStore
//
//  Created by Yang on 15/8/10.
//  Copyright (c) 2015年 zendai. All rights reserved.
//

import UIKit

class CategoryFlowLayout: UICollectionViewFlowLayout
{
    
    override func prepareLayout()
    {
        itemSize = CGSizeMake(86, 105)
        
        sectionInset = UIEdgeInsetsMake(5, 10, 5, 10)
    }
}
