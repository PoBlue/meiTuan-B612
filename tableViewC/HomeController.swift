//
//  ViewController.swift
//  tableVC
//
//  Created by blues on 16/2/3.
//  Copyright © 2016年 blues. All rights reserved.
//

import UIKit
let mainBundle = NSBundle.mainBundle()
var tableViewHeight : CGFloat!
var footerViewH = tableViewHeight / 30
var screenW : CGFloat!


class HomeController: UIViewController{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var detailVC: DetailViewController!
    
    var images = []
    
    var PageCell:UITableViewCell!
    var PageCellRowH : CGFloat!
    
    var objects = (1..<10).map{i -> String in
        return "item number #\(i)"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setTheData()
        initNibForCell()
        addRefreshController()
        detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! DetailViewController
        detailVC.hidesBottomBarWhenPushed = true
        
        self.searchBar.backgroundImage = UIImage()
        let  footerView = NSBundle.mainBundle().loadNibNamed("FooterView", owner: self, options: nil)[0] as! UIView
        let frame = CGRectMake(0, 0, view.frame.size.width,footerView.frame.size.height)
        footerView.frame = frame
        tableView.tableFooterView = footerView
        
        
        
        images = DataAPI.shareInstance.getImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

extension HomeController {
    
    func loadNavView(){
//        let navView = NSBundle.mainBundle().loadNibNamed("NavView", owner: self, options: nil)[0] as! NavView let frame = CGRectMake(0, 0, view.frame.size.width, navRootView.frame.size.height)
//        navView.frame = frame
//        //add navView constrain
//        navRootView.addSubview(navView)
    }
    
    func initNibForCell(){
        
        
        self.tableView.registerNib(UINib(nibName: "PageCell", bundle: mainBundle), forCellReuseIdentifier: "PageCell")
        PageCell = tableView.dequeueReusableCellWithIdentifier("PageCell") as! PageViewCell
        PageCellRowH = PageCell.bounds.height + 10
        
        self.tableView.registerNib(UINib(nibName: "ImageCell", bundle: mainBundle), forCellReuseIdentifier: "ImageCell")
        self.tableView.registerNib(UINib(nibName: "ItemsCell", bundle: mainBundle), forCellReuseIdentifier: "ItemsCell")
        
    }
    
    func addRefreshController(){
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func refresh(refreshCtl : UIRefreshControl){
        refreshCtl.endRefreshing()
    }
    
//    func blackMagicForFooter(){
//        let dummyViewH:CGFloat = 40
//        let vFrame = CGRectMake(0, 0, self.tableView.bounds.width, dummyViewH)
//        let dummyV = UIView(frame: vFrame)
//        self.tableView.tableHeaderView = dummyV
//        self.tableView.contentInset = UIEdgeInsets(top: dummyViewH , left: 0, bottom: 0, right: 0)
//    }
    
    func setTheData(){
        tableViewHeight = self.tableView.frame.height
    }
}

