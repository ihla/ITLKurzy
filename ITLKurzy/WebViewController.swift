//
//  WebViewController.swift
//  ITLKurzy
//
//  Created by Lubos Ilcik on 1/19/15.
//  Copyright (c) 2015 Lubos Ilcik. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var containerView: UIView! = nil
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = NSURL(string:"http://www.itlearning.sk/ponuka-kurzov") {
            let req = NSURLRequest(URL:url)
            self.webView!.loadRequest(req)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
