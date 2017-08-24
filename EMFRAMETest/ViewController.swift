//
//  ViewController.swift
//  EMFRAMETest
//
//  Created by Mohammad Kukuh on 8/24/17.
//  Copyright © 2017 Emkukuh. All rights reserved.
//

import UIKit
import EMFRAME
import SwiftyJSON

class ViewController: UIViewController {
    
    var button : UIButton = {
        let but = UIButton()
        but.backgroundColor = UIColor.red
        but.setTitle("tekan saya senpai :*", for: .normal)
        but.titleLabel?.textColor = UIColor.white
        but.tag = 1
        but.translatesAutoresizingMaskIntoConstraints = false
        
        return but
    }()
    
    var buttonPost : UIButton = {
        let but = UIButton()
        but.backgroundColor = UIColor.red
        but.setTitle("to post", for: .normal)
        but.titleLabel?.textColor = UIColor.white
        but.tag = 2
        but.translatesAutoresizingMaskIntoConstraints = false
        
        return but
    }()
    
    func buttonAction(sender: UIButton){
        
        if sender.tag == 1 {
            EMFRAME.requestAPI(request: NetworkModule.loadModule(), onSuccess: { (json) in
                print("======json=====")
                print(json)
                
                print("===============")
                
                let name = json["name"].stringValue
                print(name)
            }) { (error) in
                print(error)
            }
        }else if sender.tag == 2{
            EMFRAME.requestAPI(request: NetworkModule.postModule(title: "ab", body: "cd", userId: 2), onSuccess: { (json) in
                print("======json=====")
                print(json)
                
                print("===============")
                
                let id = json["id"].string
                print(id!)
            }) { (error) in
                print(error)
            }

        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.size.height / 2) - 24).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        button.heightAnchor.constraint(equalToConstant: 34)
        
        view.addSubview(buttonPost)
        buttonPost.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
        buttonPost.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 12).isActive = true
        buttonPost.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        buttonPost.rightAnchor.constraint(equalTo: button.rightAnchor).isActive = true
        buttonPost.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

