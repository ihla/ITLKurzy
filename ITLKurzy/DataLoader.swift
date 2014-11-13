//
//  DataLoader.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 11/13/14.
//  Copyright (c) 2014 Lubos Ilcik. All rights reserved.
//

import Foundation

// URL of JSON data to be loaded
let CoursesURL = NSURL(string: "http://www.itlearning.sk/edi/json.php")!

/// Utility class containing convenience methods for downloading data.
class DataLoader {
    
    /// Loads courses JSON data in background and returns it as NSData upon success.
    class func loadCoursesWithSuccess(succes: ((data: NSData!) -> Void)) {
        loadDataFromURL(CoursesURL, completion: { (data, error) -> Void in
            if let coursesData = data {
                succes(data: coursesData)
            }
        })
    }
    
    /// Loads data from the given URL and calls the completion handler at the end of download.
    /// Uses NSURLSession for downloading URL content in the background task.
    /// Returns data (optional) and error (optional) through completion handler.
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        
        var session = NSURLSession.sharedSession()
        
        // create background task
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            // check error and return data value accordingly
            if let responseError = error {
                // error occured, return response error
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                // HTTP response receieved - check code
                if httpResponse.statusCode != 200 {
                    // status code is not OK (200), return  error containing HTTP response code
                    var statusError = NSError(domain:"sk.itlearning", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    // HTTP response is 200 = OK
                    completion(data: data, error: nil)
                }
            }
        })
        // call resume() to start task
        loadDataTask.resume()
    }
}
