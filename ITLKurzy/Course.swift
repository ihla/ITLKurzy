//
//  Course.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 11/13/14.
//  Copyright (c) 2014 Lubos Ilcik. All rights reserved.
//

import Foundation

class Course: NSObject {
    // the Course is defind by constant properties:
    let title: String
    let price: String
    let discount: String
    let oldPrice: String
    let date: String
    let imageURL: String
    let contentDescription: String
    let duration: String
    let type: String
    let orderURL: String
    let detailURL: String
    
    // when we declare constant properties we have to initialize them in the designated initializer
    // (since the initializer parameters are optional we have to take care for nil values)
    init(title: String?, price: String?, discount: String?, oldPrice: String?, date: String?, imageURL: String?,
        contentDescription: String?, duration: String?, type: String?, orderURL: String?, detailURL: String?) {
        // the operator ?? is the Nill Coalescing Operator used to unwrap optional type
        // c = a ?? b is the same as c = a != nil ? a! : b
        self.title = title ?? ""
        self.price = price ?? ""
        self.discount = discount ?? ""
        self.oldPrice = oldPrice ?? ""
        self.date = date ?? ""
        self.imageURL = imageURL ?? ""
        self.contentDescription = contentDescription ?? ""
        self.duration = duration ?? ""
        self.type = type ?? ""
        self.orderURL = orderURL ?? ""
        self.detailURL = detailURL ?? ""
    }
    
    
   
}
