//
//  TargetType.swift
//  AlamofireAndGenerics
//
//  Created by Husnain Ali on 10/31/20.
//  Copyright © 2020 Husnain Ali. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPMethod: String{
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task{
    
    case requestPlain
    case requestParameters(parameter: [String: Any] , encoding: ParameterEncoding)
}

protocol TargetType {
    
    var baseURL: String {get}
    
    var path: String {get}
    
    var methods: HTTPMethod {get}
    
    var task: Task {get}
    
    var headers: [String: String]? {get}
}
