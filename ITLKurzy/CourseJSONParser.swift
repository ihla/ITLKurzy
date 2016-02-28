//
//  CourseJSONParser.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 11/29/14.
//  Copyright (c) 2014 Lubos Ilcik. All rights reserved.
//

import Foundation

class CourseJSONParser: NSObject {
    let data: NSData
    var courses = [Course]()
    
    init(data: NSData) {
        self.data = data
    }
    
    func getCourses() -> [Course] {
        // data contains list of courses in JSON format
        let jsonData = JSON(data: data)
        let records = jsonData["records"].arrayValue
        //            println(records)
        for record in records {
            let title: String? = record["title"].stringValue
            let price: String? = record["new_price"].stringValue
            let oldPrice: String? = record["old_price"].stringValue
            let discount: String? = record["discount"].stringValue
            let date: String? = record["start_date"].stringValue
            let imageURL: String? = record["url_image"].stringValue
            let contentDescription: String? = record["description"].stringValue
            let duration: String? = record["class_duration"].stringValue
            let type: String? = record["class_type"].stringValue
            let orderURL: String? = record["url_order"].stringValue
            let detailURL: String? = record["url_detail"].stringValue
            
            //                print(title!)
            //                print(contentDescription!)
            //                print()
            
            let course = Course(title: title, price: price, discount: discount, oldPrice: oldPrice, date: date, imageURL: imageURL,
                contentDescription: contentDescription, duration: duration, type: type, orderURL: orderURL, detailURL: detailURL)
            self.courses.append(course)
        }
        return self.courses
    }
    
}
