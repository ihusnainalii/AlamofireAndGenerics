//
//  UserModel.swift
//  AlamofireAndGenerics
//
//  Created by Husnain Ali on 11/1/20.
//  Copyright © 2020 Husnain Ali. All rights reserved.
//

import Foundation

class UserModel: Codable{
    
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String , CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
