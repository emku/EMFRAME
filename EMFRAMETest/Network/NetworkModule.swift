//
//  NetworkModule.swift
//  EMFRAME
//
//  Created by Mohammad Kukuh on 8/24/17.
//  Copyright © 2017 Emkukuh. All rights reserved.
//

import Foundation
import EMFRAME
import Alamofire


enum NetworkModule: URLRequestConvertible {
    case loadModule()
    case postModule(title: String, body: String, userId: Int)
    
    var method : HTTPMethod{
        switch self {
        case .loadModule():
            return .get
        case .postModule(_):
            return .post
        }
    }
    
    var path : String {
        switch self {
        case .loadModule():
            return "users/1"
        case .postModule(_):
            return "posts"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Helper.baseURL())!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        //for header
        //urlRequest.addValue("value", forHTTPHeaderField: "header")
        
        print(urlRequest.url?.absoluteString as Any)
        return urlRequest
    }
}
