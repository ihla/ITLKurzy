//
//  Top10ViewController.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 2/26/15.
//  Copyright (c) 2015 Lubos Ilcik. All rights reserved.
//

import UIKit

class Top10ViewController: CoursesTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DataLoader.loadTop10WithSuccess( { (data) -> Void in
            let parser = CourseJSONParser(data: data)
            self.courses = parser.getCourses()
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
        })

    }

}
