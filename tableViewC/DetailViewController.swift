//
//  DetailViewController.swift
//  tableViewC
//
//  Created by blues on 16/3/10.
//  Copyright © 2016年 blues. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var headerView : HeaderView!
    var headerCell : UITableViewCell!
    var headerY : CGFloat!
    var headerViewAdded : Bool = false
    
    override func viewDidLoad() {
        self.tableView.registerNib(UINib(nibName: "ImageCell", bundle: mainBundle), forCellReuseIdentifier: "ImageCell")
        createStickyHeaderView()
    }
    
    
    func createStickyHeaderView(){
        headerView = NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)[0] as! HeaderView
        
        headerY = tableViewHeight / 3
        headerView.frame.origin.y = headerY
        headerView.frame.size.height = tableViewHeight / 9
        headerView.frame.size.width = 600
        tableView.addSubview(headerView)
    }
    
    
    
    
    

}

extension DetailViewController: UITableViewDataSource{
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableViewHeight / 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            if indexPath.row == 0{
                return headerY
            }
            return tableViewHeight / 9
        case 1:
            return tableViewHeight / 9
            
        default:
            return tableViewHeight / 11
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return 3
        case 1:
            return 2
        case 2:
            return 2
        case 3:
            return 2
        case 4:
            return 3
        case 5:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let imageCell = tableView.dequeueReusableCellWithIdentifier("ImageCell") as! TableViewCell
        let textCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell")!
        
        switch indexPath.section{
        case 0:
            if indexPath.row == 0{
                imageCell.imageV.image = UIImage(named: "mainImage")
                return imageCell
            }
            
            if indexPath.row == 1{
                
                return headerCell
            }
            
            return textCell
        case 1:
            return textCell
        case 2:
            return textCell
        case 3:
            return textCell
        case 4:
            return textCell
        case 5:
            return textCell
        default:
            return textCell
        }
        
    }
    
    
    
}
extension DetailViewController: UITableViewDelegate{
    func scrollViewDidScroll(scrollView: UIScrollView) {
            headerView.frame.origin.y =  max(headerY, scrollView.contentOffset.y)
        }

}

