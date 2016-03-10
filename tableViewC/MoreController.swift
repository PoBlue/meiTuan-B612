//
//  MoreController.swift
//  tableViewC
//
//  Created by blues on 16/3/10.
//  Copyright © 2016年 blues. All rights reserved.
//

import UIKit

class MoreController: UIViewController {
    
    let moreData = [["扫一扫"],["省流量模式","消息提醒","邀请好友使用美团","清空缓存"],["意见反馈","问卷调查","支付帮助","网络诊断","关于美团","我要应聘"],["精品应用"]]
    
    
    
    
}

extension MoreController: UITableViewDataSource{
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let returnCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        returnCell.textLabel?.text = moreData[indexPath.section][indexPath.row]
        return returnCell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return moreData.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreData[section].count
    }
    
    
}

extension MoreController: UITableViewDelegate{
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableViewHeight / 11
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return tableViewHeight / 22
        }
        return 0.1
    }
    
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableViewHeight / 22
    }
}