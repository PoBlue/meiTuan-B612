//
//  MineControllerViewController.swift
//  tableViewC
//
//  Created by blues on 16/3/10.
//  Copyright © 2016年 blues. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        self.tableView.contentInset = UIEdgeInsets(top: -0.1 , left: 0, bottom: 0, right: 0)
        self.tableView.registerNib(UINib(nibName: "ImageCell", bundle: mainBundle), forCellReuseIdentifier: "ImageCell")
    }
}

extension MineViewController : UITableViewDataSource{
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let imageCell = tableView.dequeueReusableCellWithIdentifier("ImageCell") as! 
        TableViewCell
        let textCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        switch indexPath.section{
        case 0:
            imageCell.imageV.image = UIImage(named: "minePageMes")
            return imageCell
        
        case 1:
            if indexPath.row == 1{
                imageCell.imageV.image = UIImage(named: "minePageBtns")
                return imageCell
            }
        default:
            return textCell
        }
        
        return textCell
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return 2
        case 2:
            return 2
        default:
            return 1
        }
    }
    
    
}

extension MineViewController : UITableViewDelegate{
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return tableViewHeight * 3 / 11
        }
        
        if indexPath.section == 1 && indexPath.row == 1{
            return tableViewHeight * 2 / 11
        }
        
        return tableViewHeight / 11
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableViewHeight / 22
    }
}
