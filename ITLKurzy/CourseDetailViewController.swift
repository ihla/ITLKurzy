//
//  CourseDetailViewController.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 1/18/15.
//  Copyright (c) 2015 Lubos Ilcik. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var annotation: UILabel!
    
    // test
    let lorem = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."

    let loremShort = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        courseTitle.text = loremShort
        annotation.text = lorem
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        // When using a Universal storyboard the default size of the scene is 600.
        // That's why the scrollView contentSize width is set the 600 if it is pinned to the both sides.
        // We need to set the correct content size in order scroll only vertically.
        // The viewDidLayoutSubviews() is the right place to do so.
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: scrollView.contentSize.height)
    }

}
