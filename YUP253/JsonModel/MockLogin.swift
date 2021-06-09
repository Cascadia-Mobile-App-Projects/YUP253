//
//  MockUser.swift
//  YUP253
//
//  Created by Stephen Gomez-Fox on 6/4/21.
//

import Foundation

class MockLogin {

    var loginResponse = LoginResponse()
    var loginResponseData = LoginResponseData()
    var loginDetails = LoginDetails()
    var userDetails = UserDetails()
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    let formatter = ISO8601DateFormatter()
    
    init() {
        decoder.dateDecodingStrategy = .iso8601
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = .prettyPrinted
        self.loginResponse.success = false
        self.loginResponse.message = "uninitialized"
    }
    
    func PrintResults() {
        let jsonData = try! encoder.encode(loginResponse)
        let jsonString = String(data: jsonData, encoding: .utf8)
        print("RESULTS:\n\(jsonString ?? "Uninitialized")")
    }
    
    func UltimateCena() {
        self.userDetails.user_id = UUID(uuidString: "68753A44-4D6F-1226-9C60-0050E4C00067")
        self.userDetails.first_name = "John"
        self.userDetails.last_name = "Cena"
        self.userDetails.birthdate = self.formatter.date(from: "1977-04-23T00:00:00Z")
        self.userDetails.headline = "Wrestler, Actor, Ultimate Fan"
        self.userDetails.about = "All-around talented guy looking to play some Ultimate!"
        
        // Create the data items in the login response
        self.loginResponseData.permissions = [Auth.ViewEvents, Auth.ViewFeed, Auth.ViewHighlights, Auth.ModifyEvents, Auth.ModifyHighlights]
        self.loginResponseData.token = "MoBAS123456"
        self.loginResponseData.user = self.userDetails
        
        // Finally, complete the creation the login response
        self.loginResponse.success = true
        self.loginResponse.message = "success"
        self.loginResponse.data = self.loginResponseData
    }
    
    func UltimateDylan() {
        self.userDetails.user_id = UUID(uuidString: "A358BCBA-C0DE-0807-1973-00506CD0FFEF")
        self.userDetails.first_name = "Bob"
        self.userDetails.last_name = "Dylan"
        self.userDetails.birthdate = self.formatter.date(from: "1941-05-24T00:00:00Z")
        self.userDetails.headline = "Looking for More Info"
        self.userDetails.about = "Retired musician interested in Ultimate"
        
        // Create the data items in the login response
        self.loginResponseData.permissions = [Auth.ViewEvents, Auth.ViewFeed, Auth.ViewHighlights,]
        self.loginResponseData.token = "MoBAS654321"
        self.loginResponseData.user = self.userDetails
        
        // Finally, complete the creation the login response
        self.loginResponse.success = true
        self.loginResponse.message = "success"
        self.loginResponse.data = self.loginResponseData
        
    }
    
    func UltimateAnon() {
        self.userDetails.username = ""
        self.userDetails.first_name = "New User"
        self.userDetails.user_id = UUID(uuidString: "CA5CAD1A-0000-0000-0000-000000000000")
        self.loginResponseData.user = self.userDetails
        self.loginResponseData.token = "abcdefg"
        self.loginResponseData.permissions = [.ViewEvents, .ViewFeed, .ModifyEvents]
        self.loginResponse.success = true
        self.loginResponse.message = "success"
        self.loginResponse.data = self.loginResponseData
    }
    
    func InvalidLogin() {
        self.loginResponse.success = false
        self.loginResponse.message = "Invalid username or password"
        self.loginResponse.data = nil
    }
    
    func CreateLoginDetails(username: String? = nil, password: String? = nil, token: String? = nil) {
        // Create the LoginDetails struct from username/password
        loginDetails.username = username ?? ""
        if let pw : String = password {
            loginDetails.password = pw }
        if let tk : String = token {
            loginDetails.authtoken = tk
        }
    }
    
    func CheckCredentials() {
        
        switch loginDetails.username {
        
            case "John": do {
                if loginDetails.password == "Cena" || loginDetails.authtoken == "MoBAS123456" {
                    UltimateCena()
                } else {
                    InvalidLogin()
                }
            }

            case "Bob": do {
                if loginDetails.password == "Dylan" || loginDetails.authtoken == "MoBAS654321" {
                    UltimateDylan()
                } else {
                    InvalidLogin()
                }
            }
                
            case "", "anonymous", String?(nil): do {
                UltimateAnon()
            }
            
            default: do {
                InvalidLogin()
            }
        }
    }
    
    convenience init(username: String? = nil, password: String? = nil) {
        self.init()
        CreateLoginDetails(username: username, password: password)
        CheckCredentials()
        PrintResults()
    }
    
    convenience init(username: String? = nil, token: String? = nil) {
        self.init()
        CreateLoginDetails(username: username, token: token)
        CheckCredentials()
        PrintResults()
    }
}
