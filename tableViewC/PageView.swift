//
//  PageView.swift
//  tableViewC
//
//  Created by blues on 16/2/11.
//  Copyright © 2016年 blues. All rights reserved.
//

import Foundation
import UIKit

class PageViewCell: UITableViewCell ,UIScrollViewDelegate{
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func awakeFromNib() {
        scrollView.delegate = self
        
        let btnW = self.scrollView.frame.width / 4
        let btnH = self.scrollView.frame.height / 2
        _ = (0..<16).map{ i in
            let i = CGFloat(i)
            if (i < 8){
                let frame = CGRectMake(i * btnW, 0, btnW, btnH)
                let btn = UIButton(frame: frame)
                btn.setTitle("\(i)", forState: .Normal)
                btn.backgroundColor = UIColor.blueColor()
                self.scrollView.addSubview(btn)
                return
            }
            if(i < 16){
                let frame = CGRectMake((i - 8) * btnW, btnH, btnW, btnH)
                let btn = UIButton(frame: frame)
                btn.setTitle("\(i)", forState: .Normal)
                self.scrollView.addSubview(btn)
                btn.backgroundColor = UIColor.blueColor()
                return
            }
            
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}

