//
//  Helper.swift
//  EMFRAME
//
//  Created by Mohammad Kukuh on 8/24/17.
//  Copyright © 2017 Emkukuh. All rights reserved.
//

import Foundation
import UIKit

public struct Helper {
    
    public static func baseURL() -> String{
        return "http://jsonplaceholder.typicode.com/"
    }
    
    
    public static func generateDeviceID()->String{
        //device id
        let deviceid = UIDevice.current.identifierForVendor?.uuidString
        return deviceid!
    }
    

    
}
