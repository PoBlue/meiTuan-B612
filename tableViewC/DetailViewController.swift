//
//  DetailViewController.swift
//  tableViewC
//
//  Created by blues on 16/3/10.
//  Copyright © 2016年 blues. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewWillAppear(animated: Bool) 
    {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true

    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }

}

extension DetailViewController: UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return 1
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
        let imageCell = tableView.dequeueReusableCellWithIdentifier("ImageCell")!
        let textCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        switch indexPath.section{
        case 0:
            return imageCell
        case 1:
            return textCell
        case 2:
            return imageCell
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
extension DetailViewController: UITableViewDelegate{}
