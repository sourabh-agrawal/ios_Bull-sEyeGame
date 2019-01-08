//
//  ViewController.swift
//  BullsEye
//
//  Created by sourabh agrawal on 08/01/19.
//  Copyright © 2019 sourabh agrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Hello there", message: "This is my first app", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func showKnock(){
        let alert = UIAlertController(title: "ohh", message: "who is there", preferredStyle: .alert)
        let action = UIAlertAction(title: "close", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

