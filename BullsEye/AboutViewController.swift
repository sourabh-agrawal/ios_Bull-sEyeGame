//
//  AboutViewController.swift
//  BullsEye
//
//  Created by sourabh agrawal on 09/01/19.
//  Copyright © 2019 sourabh agrawal. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            let url = URL(fileURLWithPath: htmlPath)
            let reuest = URLRequest(url: url)
            webView.load(reuest)
        }
    }
    
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
    
}
