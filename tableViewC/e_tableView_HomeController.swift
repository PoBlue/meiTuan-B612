//
//  e_tableView_HomeController.swift
//  tableViewC
//
//  Created by blues on 16/3/5.
//  Copyright © 2016年 blues. All rights reserved.
//

import Foundation
import UIKit

extension HomeController : UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3{
            return objects.count
        }
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            return PageCell
        }
        
        let imageCell = tableView.dequeueReusableCellWithIdentifier("ImageCell") as! TableViewCell
        
        switch indexPath.section {
            
        case 1:
            imageCell.imageV.image = self.images[0] as? UIImage
        case 2:
            imageCell.imageV.image = self.images[1] as? UIImage
        case 3:
            if indexPath.row == 0{
                imageCell.imageV.image = self.images[2] as? UIImage
            }
            else{
                imageCell.imageV.image = self.images[3] as? UIImage
            }
            
        default:
            print("error")
        }
        
        
        return imageCell
        

    }
}

extension HomeController : UITableViewDelegate{
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section < 3 {
            return false
        }
        return true
    }
    
    
    
    //MARK: - Hight for header 
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footerViewH
    }
    
    
    
    //MARK: - Hight for row
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return PageCellRowH
        }
        
        if indexPath.section == 1{
            return tableViewHeight / 3
        }
        
        if indexPath.section == 2{
            return (tableViewHeight / 3) - (2 * footerViewH)
        }
        
        if indexPath.section == 3{
            if indexPath.row == 0{
                return tableViewHeight / 10
            }
            
            return tableViewHeight / 4
        }
            return 50
    }
    
}
