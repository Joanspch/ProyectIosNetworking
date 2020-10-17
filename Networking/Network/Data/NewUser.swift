//
//  NewUser.swift
//  Networking
//
//  Created by Joan Paredes on 10/13/20.
//

import Foundation
//Encodable: transformar un objeto swift en json
struct NewUser: Encodable {
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
}
