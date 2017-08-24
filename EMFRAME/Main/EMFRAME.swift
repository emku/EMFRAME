//
//  EMFRAME.swift
//  EMFRAME
//
//  Created by Mohammad Kukuh on 8/24/17.
//  Copyright © 2017 Emkukuh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class EMFRAME {
    
    //standar without method
    public static func requestAPI(url : String,
        onSuccess: @escaping (_ result:JSON)->Void,
        onFail: @escaping (_ response:String)->Void) {
    
        print(url)
        
        let url = URL(string: url)
        let req = URLRequest(url: url!)
           
            EMNETS.request(urlRequest: req, onSuccess: { (json) in
                onSuccess(json)
            }) { (err) in
                onFail(err)
            }
    }
    
    //with method
    public static func requestAPI(url:String ,withHTTPMethod method :HTTPMethod){}
    
}
