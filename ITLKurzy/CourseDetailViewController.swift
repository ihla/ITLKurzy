//
//  CourseDetailViewController.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 1/18/15.
//  Copyright (c) 2015 Lubos Ilcik. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController {

    var course: Course?
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var annotation: UILabel!
    
    @IBOutlet weak var courseType: UILabel!
    @IBOutlet weak var courseLength: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        // When using a Universal storyboard the default size of the scene is 600.
        // That's why the scrollView contentSize width is set the 600 if it is pinned to the both sides.
        // We need to set the correct content size in order scroll vertically only.
        // The viewDidLayoutSubviews() is the right place to do so.
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: scrollView.contentSize.height)
    }

    func configureView() {
        if let c = course {
            courseTitle.text = c.title
            annotation.text = c.contentDescription
            courseType.text = c.type == "v" ? "Víkendový" : (c.type == "d" ? "Denný" : "Viac info na web stránke kurzu")
            coursePrice.attributedText = priceAttributedTextOfCourse(c)
            courseLength.text = durationInDays(c.duration) ?? "Viac info na web stránke kurzu"
        }
    }
    
    func durationInDays(duration:String) -> String? {
        if let duration = duration.toInt() {
            var number = duration
            var days = ""
            switch duration {
            case 1:
                days = "deň"
            case 2...4:
                days = "dni"
            default:
                days = "dní"
            }
            return "\(number) \(days)"
        }
        return nil
    }
    
    func priceAttributedTextOfCourse(course: Course!) -> NSAttributedString {
        var attributedText = NSMutableAttributedString(string: "\(course.price)€")
        
        if course.discount != "0" {
            let newPriceString: String = "\(course.price)€"
            let discountString: String = "(-\(course.discount)%)"
            let attributedTextString: String = "\(newPriceString) \(discountString)"
            attributedText = NSMutableAttributedString(string: attributedTextString)
            attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: (attributedTextString as NSString).rangeOfString(discountString))
        }
        
        return attributedText
    }
}
