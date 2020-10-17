//
//  User.swift
//  Networking
//
//  Created by Joan Paredes on 10/12/20.
//

import Foundation

//Decodable : transforma un objeto json en un objeto swift
struct UserResponse: Decodable{
    let code: Int?
    let meta: Meta?
    let data: User?
}

struct User: Decodable {
    
    let id: Int?
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
    let createdAt: Date?
    let updatedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case gender
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
}



struct Meta: Decodable {
    
    
}
