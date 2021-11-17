//
//  JsonLogin.swift
//  YUP253
//
//  Created by Stephen Gomez-Fox on 5/27/21.
//

import Foundation

struct LoginDetails : Codable {
    var username : String? = "anonymous"
    var password: String?
    var authtoken: String?
}

// user details returned from the server
struct UserDetails : Codable {
    var user_id : UUID?
    var username : String?
    var first_name : String?
    var last_name : String?
    var birthdate : Date?
    var headline: String?
    var about : String?
    var avatar : URL?
}

// sections returned under "data"
struct LoginResponseData : Codable {
    var token: String?
    var permissions: Auth?
    var user : UserDetails?
}

// general response: success, message, data
struct LoginResponse : Codable {
    var success : Bool? = false
    var message : String?
    var data : LoginResponseData?
}

