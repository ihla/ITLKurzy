//
//  Course.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 11/13/14.
//  Copyright (c) 2014 Lubos Ilcik. All rights reserved.
//

import Foundation

class Course: NSObject {
    let title: String
    let price: String
    let discount: String
    let date: String
    let imageURL: String
    
    init(title: String?, price: String?, discount: String?, date: String?, imageURL: String?) {
        self.title = title ?? ""
        self.price = price ?? ""
        self.discount = discount ?? ""
        self.date = date ?? ""
        self.imageURL = imageURL ?? ""
    }
    
    
   
}
