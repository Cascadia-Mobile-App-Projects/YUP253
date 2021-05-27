//
//  JsonLogin.swift
//  YUP253
//
//  Created by Stephen Gomez-Fox on 5/27/21.
//

import Foundation

struct LoginDetails : Codable {
    var username : String = "anonymous"
    var password: String?
    var authtoken: String?
}

// user details returned from the server
struct UserDetails : Codable {
    var id : UUID
    var username : String
    var first_name : String
    var last_name : String
    var birthdate : Date?
    var headline: String?
    var about : String?
    var avatar : URL?
    var permissions: Int
}

// sections returned under "data"
struct LoginResponseData : Codable {
    var user : UserDetails?
    var permissions: Int?
    var token: String
}

// general response: success, message, data
struct LoginResponse : Codable {
    var success : Bool = false
    var message : String?
    var data : LoginResponseData?
}
