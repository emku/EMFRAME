//
//  EMNETS.swift
//  EMFRAME
//
//  Created by Mohammad Kukuh on 8/22/17.
//  Copyright © 2017 Emkukuh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


public class EMNETS {
    
    public static func request(
        urlRequest : URLRequestConvertible,
        onSuccess: @escaping (_ result:JSON)->Void,
        onFail: @escaping (_ response:String)->Void){
        
        var req :URLRequest?
        do {
            req = try urlRequest.asURLRequest()
        }catch{
            req = nil
            onFail("Error :: \(error.localizedDescription)")
        }
        
      getRest(req: req!, response: { (json) in
        onSuccess(json!)
      }) { (error) in
        onFail(error)
        }
    }
        
    
    fileprivate static func getRest(req : URLRequest, response : @escaping (JSON?)->(),errorString : @escaping (String) ->() ){
        _ = Alamofire.request(req).responseJSON { (resp) in
            var json : JSON?
            var err : String
            
            switch resp.result{
            case .success(let value):
                json = JSON(value)
                response(json)
            case .failure(let error):
                err = error.localizedDescription
                errorString(err)
            }
            
        }
    }
}
