//
//  ViewController.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 11/13/14.
//  Copyright (c) 2014 Lubos Ilcik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // test
        DataLoader.loadCoursesWithSuccess { (data) -> Void in
            // data contains list of courses in JSON format
            let jsonData = JSON(data: data)
            if let records = jsonData["records"].arrayValue {
                
                for record in records {
                    let title = record["title"]
                    let price = record["new_price"]
                    let discount = record["discount"]
                    println("\(title)\n\(price)\n\(discount)")
                }
                
//                println("all records:\n")
//                println(records)
//                println("\nrecord[0]\n")
//                println(records[0]["description"])
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

