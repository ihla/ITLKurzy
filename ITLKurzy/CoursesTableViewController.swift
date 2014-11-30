//
//  CoursesTableViewController.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 11/13/14.
//  Copyright (c) 2014 Lubos Ilcik. All rights reserved.
//

import UIKit

class CoursesTableViewController: UITableViewController {
    
    let CellIdentifier = "CourseCell"
    
    var courses = [Course]()
    var imageCache = [String : UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataLoader.loadCoursesWithSuccess( { (data) -> Void in
            let parser = CourseJSONParser(data: data)
            self.courses = parser.getCourses()
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return courses.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as CourseTableViewCell

        cell.courseDescription.text = courses[indexPath.row].title
        cell.coursePrice.text = "\(courses[indexPath.row].price)€"
        var discount: String? = courses[indexPath.row].discount != "0" ? courses[indexPath.row].discount : nil
        if discount != nil {
            cell.courseDiscount.text = "-\(discount!)%"
        } else {
            cell.courseDiscount.text = ""
        }
        if let timeInterval = courses[indexPath.row].date.toInt() {
            var date = NSDate(timeIntervalSince1970: NSTimeInterval(timeInterval))
            var dateFormatter = NSDateFormatter()
//            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.dateFormat = "dd.MM.yyyy"
            
            cell.courseDate.text = dateFormatter.stringFromDate(date)
            
        }
        cell.courseImage.image = UIImage(named: "placeholder")
        var imageURL = courses[indexPath.row].imageURL
//        var imageURL = "http://www.itlearning.sk/ikony-kurzy/53.jpg"
        var image = imageCache[imageURL]
        if image == nil {
            if let url = NSURL(string: imageURL) {
                let request: NSURLRequest = NSURLRequest(URL: url)
                NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                    if error == nil {
                        image = UIImage(data: data)
                        // check if image contains valid data (in case of 4xx the received data is invalid)
                        var ref = image?.CGImage
                        if ref == nil {
                           image = UIImage(named: "placeholder")
                        }
                        self.imageCache[imageURL] = image
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) as? CourseTableViewCell {
                                cellToUpdate.courseImage.image = image
                            }
                        })
                    } else {
                        println("Error: \(error.localizedDescription)")
                    }
                })
                
            } else {
                println("Error: \(imageURL) is not valid URL")
            }
        } else {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) as? CourseTableViewCell {
                    cellToUpdate.courseImage.image = image
                }
            })
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
