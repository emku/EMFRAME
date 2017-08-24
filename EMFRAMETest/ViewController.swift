//
//  ViewController.swift
//  EMFRAMETest
//
//  Created by Mohammad Kukuh on 8/24/17.
//  Copyright © 2017 Emkukuh. All rights reserved.
//

import UIKit
import EMFRAME

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       EMFRAME.requestAPI(url: "http://jsonplaceholder.typicode.com/users/1", onSuccess: { (json) in
        print("======json=====")
        print(json)
        print("===============")
       }) { (error) in
        print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

