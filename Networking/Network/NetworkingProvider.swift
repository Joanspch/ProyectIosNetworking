//
//  NetworkingProvider.swift
//  Networking
//
//  Created by Joan Paredes on 10/12/20.
//

import Foundation
import  Alamofire

final class NetworkingProvider{
    static let shared = NetworkingProvider()
    
    private let kBaseUrl = "https://gorest.co.in/public-api/"
    private let ktoken = "put ur token"
    private let kStatusOk = 200...299
    
//Funcion Asincrona
    func getUser(id:Int, success: @escaping (_ user: User) ->(), failure: @escaping(_ error: Error?)->()) {
        let url = "\(kBaseUrl)users/\(id)"
        
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self, decoder:DateDecoder()){ response in
            
        if let user = response.value?.data{
            success(user)
        }else{
            failure(response.error)
        }
    }
}
    func addUser(user: NewUser,  success: @escaping (_ user: User) ->(), failure: @escaping(_ error: Error?)->()) {
       
        let url = "\(kBaseUrl)users"
        let headers: HTTPHeaders = [.authorization(bearerToken: ktoken)]
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self, decoder:DateDecoder()){ response in
            
            if let user = response.value?.data, user.id != nil{
            success(user)
        }else{
            failure(response.error)
        }
    }
}
    func updateUser(id:Int, user: NewUser,  success: @escaping (_ user: User) ->(), failure: @escaping(_ error: Error?)->()) {
        let url = "\(kBaseUrl)users/\(id)"
        let headers: HTTPHeaders = [.authorization(bearerToken: ktoken)]
        
        AF.request(url, method: .put, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self, decoder:DateDecoder()){ response in
            
            if let user = response.value?.data, user.id != nil{
            success(user)
        }else{
            failure(response.error)
        }
    }
}
    func delateUser(id:Int, success: @escaping () ->(), failure: @escaping(_ error: Error?)->()) {
        let url = "\(kBaseUrl)users/\(id)"
        let headers: HTTPHeaders = [.authorization(bearerToken: ktoken)]
        
        AF.request(url, method: .delete, headers: headers).validate(statusCode: kStatusOk).response { response in
            if let error = response.error{
                failure(error)
            }else{
                success()
            }
        }
    }
}
    

