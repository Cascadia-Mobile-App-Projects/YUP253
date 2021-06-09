//
//  LoginController.swift
//  YUP253
//
//  Created by Stephen Gomez-Fox on 6/1/21.
//

import Foundation





// Login to server
// (Mock login)



class LoginController {


    static func login(username: String?, password: String? = nil, authtoken: String? = nil) -> LoginResponse {
        
        // login details sent to server (password -or- authtoken)

        let authJson = """
            [ "ModifyEvents", "ViewEvents" ]
            """
        
        
        
        var loginDetails : LoginDetails = LoginDetails()
        var response : LoginResponse = LoginResponse()
        let decoder = JSONDecoder()
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601
        //encoder.keyEncodingStrategy = .convertToSnakeCase
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        
        var authtest : Auth = try! decoder.decode(Auth.self, from: Data(authJson.utf8))
        
        
        // Use MockLogin to get response
        /*
        var login : MockLogin
        
        if (username == nil || username == "") {
            login = MockLogin(username: nil, token: nil)
        } else if password != nil {
            login = MockLogin(username: username, password: password)
        } else if authtoken != nil {
            login = MockLogin(username: username, token: authtoken)
        } else {
            login = MockLogin(username: "Invalid", password: "Login")
        }
        
        let jsonData = try! encoder.encode(login.loginResponse)
        let jsonString = String(data: jsonData, encoding: .utf8)
        print("RESPONSE:\n\(jsonString ?? "No Response")")
        
        // Inform app of results
        
        
        
        
    }
        */
        
        // Place provided info into struct for JSON encoding
        if let username = username {
            loginDetails.username = username
            loginDetails.password = password
            loginDetails.authtoken = authtoken
        }
        



        // MARK - Send Login ( MOCK - Prints to console)

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
        var data : Data?
        responseFile = "LoginFailure"  // Default
        let anonUsers : [String?] = ["anonymous", "anon", ""]
        if anonUsers.contains(username ?? "") {
            responseFile = "AnonUser"
        }
        if username == "John" && password == "Cena" {
            responseFile = "JohnCenaSuccess"
        }
        
        if username == "Bob" && password == "Dylan" {
            responseFile = "BobDylanSuccess"
        }

        if let fileURL = Bundle.main.url(forResource: responseFile, withExtension: "json") {
                let text = try? String(contentsOf: fileURL)
            if let server = text { print("SERVER RESPONSE: \n\(server)\n") }
                data = Data(text!.utf8)
        }
        
        // Decode the response
        if let resp = data {
            do {
                try response = decoder.decode(LoginResponse.self, from: resp)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("NO DATA")
        }
        
        // Print results to console
        if let user = response.data?.user {
            print("\nLOGON\nusername: \(user.username ?? "none")")
            print("Name: \(user.first_name ?? "First") \(user.last_name ?? "Last")")
            print("Headline: \(user.headline ?? "none")")
            print("About: \(user.about ?? "none") ")
            if let permissions = response.data?.permissions {
                print("Permissions: \(permissions)\n")
            }
        }
        return response
    }
}
