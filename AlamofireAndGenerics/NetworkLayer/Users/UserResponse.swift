//
//  UserResponse.swift
//  AlamofireAndGenerics
//
//  Created by Husnain Ali on 11/1/20.
//  Copyright © 2020 Husnain Ali. All rights reserved.
//

import Foundation

class UserResponse: Codable{
    
    let data: [UserModel]?
    
    enum CodingKeys: String , CodingKey {
        case data = "data"
    }
}
