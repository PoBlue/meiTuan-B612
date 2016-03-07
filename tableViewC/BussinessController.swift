//
//  BussinessController.swift
//  tableViewC
//
//  Created by blues on 16/3/6.
//  Copyright © 2016年 blues. All rights reserved.
//

import UIKit 

class BussinessController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        self.tableView.registerNib(UINib(nibName: "ImageCell", bundle: mainBundle), forCellReuseIdentifier: "ImageCell")
    }
}

extension BussinessController:UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let imageCell = tableView.dequeueReusableCellWithIdentifier("ImageCell") as! TableViewCell
        imageCell.imageV.image = DataAPI.shareInstance.getImages()[3]
        
        return imageCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
}

extension BussinessController:UITableViewDelegate{}