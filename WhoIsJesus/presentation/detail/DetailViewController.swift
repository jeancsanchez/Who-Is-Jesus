//
//  DetailViewController.swift
//  WhoIsJesus
//
//  Created by Jean  Carlos on 07/01/18.
//  Copyright © 2018 Jean  Carlos. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView?
    var url:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webview = WKWebView()
        self.view = webview
        
        let currentURL = self.url
        print("current url: \(currentURL)")
        let url = URL(string:currentURL)!
        let req = URLRequest(url:url)
        self.webview!.load(req)
    }
}
