//
//  UserNetworking.swift
//  AlamofireAndGenerics
//
//  Created by Husnain Ali on 11/1/20.
//  Copyright © 2020 Husnain Ali. All rights reserved.
//

import Foundation
import Alamofire

enum UserNetworking{
    
    case getUsers
    case createUser(name: String , job: String)
}

extension UserNetworking: TargetType{
    
    var baseURL: String {
        switch self {
        default:
            return "https://reqres.in/api"
        }
    }
    
    var path: String {
        
        switch self{
            
        case .getUsers:
            return "/users"
        case .createUser:
            return "/users"
        }
    }
    
    var methods: HTTPMethod {
        switch self{
        case .getUsers:
            return .get
        case .createUser:
            return .post
        }
    }
    
    var task: Task {
        
        switch self{
            
        case .getUsers:
            return .requestPlain
        case .createUser(let name, let job):
            return .requestParameters(parameter: ["name": name , "job": job], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        
        switch self{
        case .getUsers:
            return [:]
        case .createUser:
            return [:]
        }
    }
    
}
