//
//  BaseAPI.swift
//  AlamofireAndGenerics
//
//  Created by Husnain Ali on 10/31/20.
//  Copyright © 2020 Husnain Ali. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {

    func fetchData<M: Decodable>(target: T , responseClass: M.Type , completion: @escaping (Result<M? , NSError>) ->() ){
        
        let method = Alamofire.HTTPMethod.init(rawValue: target.methods.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        
        let params = buildParams(task: target.task)
        AF.request(target.baseURL + target.path , method: method , parameters: params.0 , encoding: params.1 , headers: headers).responseJSON { (response) in
            
            guard let statusCode = response.response?.statusCode else {
                completion(.failure(NSError()))
                return
                
            }
            
            if statusCode == 200{
                guard let responseJSON = try? response.result.get() else {
                    
                    completion(.failure(NSError()))
                    return
                }
                
                guard let responseData = try? JSONSerialization.data(withJSONObject: responseJSON, options: []) else {
                    completion(.failure(NSError()))
                    return
                }
                guard let responseObject = try? JSONDecoder().decode(M.self, from: responseData) else{
                    completion(.failure(NSError()))
                    return
                }
                
                completion(.success(responseObject))
                
            }else{
                
                completion(.failure(NSError()))
            }
            
        }
    }
    
    private func buildParams(task: Task) -> ([String: Any] , ParameterEncoding){
        
        switch task {
            
        case .requestPlain:
            return ([:] , URLEncoding.default)
        case .requestParameters(parameter: let parameter, encoding: let encoding):
            return (parameter , encoding)
        }
    }
}

