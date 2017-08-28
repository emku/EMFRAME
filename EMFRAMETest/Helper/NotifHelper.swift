//
//  NotifHelper.swift
//  EMFRAME
//
//  Created by Mohammad Kukuh on 8/25/17.
//  Copyright © 2017 Emkukuh. All rights reserved.
//

import Foundation

extension  UserDefaults {
    
    func saveUserInformation(username : String, password : String){
        
        set(["username":username,"password":password], forKey: "userData")
        synchronize()
        
    }
    
    
}
