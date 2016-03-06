//
//  FooterView.swift
//  tableViewC
//
//  Created by blues on 16/3/6.
//  Copyright © 2016年 blues. All rights reserved.
//

import UIKit

class FooterView: UIView {

    @IBOutlet weak var moreBtn: UIButton!

    @IBOutlet weak var dnaBtn: UIButton!
    override func awakeFromNib() {
        makeBorderBtn(moreBtn, radious: 3)
        makeBorderBtn(dnaBtn, radious: 8)
    }
}

func makeBorderBtn(btn:UIButton,radious:CGFloat){
    btn.layer.cornerRadius = radious
}
