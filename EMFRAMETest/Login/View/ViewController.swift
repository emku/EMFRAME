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
    var loginButton : UIButton = {
        let but = UIButton()
        but.backgroundColor = UIColor.green
        but.setTitle("LOGIN", for: .normal)
        but.titleLabel?.textColor = UIColor.white
        but.tag = 3
        but.translatesAutoresizingMaskIntoConstraints = false
        
        return but
    }()
    
    var usernameTextfield : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "username"
        tf.borderStyle = .line
        return tf
    }()
    
    var passwordTextfield : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "password"
        tf.borderStyle = .line
        return tf
    }()
    
    
    fileprivate func setupButton(){
        
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
    
    fileprivate func setupLogin() {
        view.addSubview(usernameTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(loginButton)
        
        //kasih padding dalam textfield
        usernameTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        passwordTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        
        loginButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 33.0).isActive = true
        
        passwordTextfield.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -12).isActive = true
        passwordTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        passwordTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        passwordTextfield.heightAnchor.constraint(equalToConstant: 33.0).isActive = true
        
        usernameTextfield.bottomAnchor.constraint(equalTo: passwordTextfield.topAnchor, constant: -12).isActive = true
        usernameTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        usernameTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        usernameTextfield.heightAnchor.constraint(equalToConstant: 33.0).isActive = true
        
        
    }
    
    func buttonAction(sender: UIButton){
        
        //TODO:-- pindahin request api ke interaktor
        
        switch sender.tag {
        case 1:
            EMFRAME.requestAPI(request: LoginRouter.loadModule(), onSuccess: { (json) in
                
                let name = json["name"].stringValue
                print(name)
            }) { (error) in
                print(error)
            }

        case 2:
            EMFRAME.requestAPI(request: LoginRouter.postModule(title: "ab", body: "cd", userId: 2), onSuccess: { (json) in
            
            let id = json["id"].stringValue
            print(id)
            }) { (error) in
            print(error)
            }
        case 3:
             usernameTextfield.text = "button ready"
        default:
            loginButton.setTitle("something wring", for: .normal)
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupButton()
        self.setupLogin()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

