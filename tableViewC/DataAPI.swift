//
//  DataAPI.swift
//  tableViewC
//
//  Created by blues on 16/3/5.
//  Copyright © 2016年 blues. All rights reserved.
//

import Foundation
import UIKit

class DataAPI {
    
    private let imageNames = ["SecondCell","ThridCell","GuessYourLike","otherRows"]
    private var images : [UIImage]!
    
    static var shareInstance = DataAPI()
    
    init() {
        
        images = (0..<imageNames.count).map{ i -> UIImage in
            return UIImage(named: imageNames[i] )!
        }
    }
    
    func getImages() -> [UIImage]{
        return images
    }
}