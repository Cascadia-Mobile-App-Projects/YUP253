//
//  AppRepository.swift
//  YUP253
//
//  Created by Stephen Gomez-Fox on 5/28/21.
//

import Foundation





// Login to server
// (Mock login)



class AppRepository {


    static func login(username: String?, password: String? = nil, authtoken: String? = nil) {
        
        // login details sent to server (password -or- authtoken)

        
        var loginDetails : LoginDetails! = LoginDetails()
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        // Place provided info into struct for JSON encoding
        if let username = username {
            loginDetails.username = username
            loginDetails.password = password
            loginDetails.authtoken = authtoken
        }
        
        


        // MARK - Send Login ( MOCK - Prints to console)
        
        print("Logging in as \(loginDetails.username)")
        if loginDetails.password != nil {
            print("Using password")
        }
        if loginDetails.authtoken != nil {
            print("Using authentication token)")
        }

        do {
            let jsonLogin = try encoder.encode(loginDetails)
            if let jsonString = String(data: jsonLogin, encoding: .utf8) {
                print("Login Request:\n \(jsonString)")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        
        
        
        
        
        
        
        // MARK - Get Login Response ( MOCK - Loads from file)
        
        var responseFile : String
        var response : Data?
        responseFile = "LoginFailure"
        if username == "anonymous" {
            responseFile = "AnonUser"
        }
        if username == "John" && password == "Cena" {
            responseFile = "JohnCenaSuccess"
        }
        
        if username == "Bob" && password == "Dylan" {
            responseFile = "BobDylanSuccess"
        }

        
        if let fileURL = Bundle.main.url(forResource: responseFile, withExtension: "json") {
            do {
                let data = try? String(contentsOf: fileURL)
                response = Data(data!.utf8)
            }
        }
        
        if let output = response {
            print(String(decoding: output, as: UTF8.self))
        } else {
            print("NO DATA")
        }
     
        
    }


}
