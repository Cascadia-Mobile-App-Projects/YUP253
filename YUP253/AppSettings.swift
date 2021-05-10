//
//  AppSettings.swift
//  YUP253
//
//  Created by Stephen Gomez-Fox on 4/22/21.
//

import Foundation

class AppSettings {

    // instance
    private static let sharedAppSettings = AppSettings()
    
    // default property values
    private var _username = "anonymous"
    private var _authToken = ""
    
    
    // private initializer; initialize with default property values
    private init() {
        // initialize username if not previously set
        if let user = UserDefaults.standard.string(forKey:"username") {
            self._username = user
        } else {
            UserDefaults.standard.set(_username, forKey:"username")
        }
        
        // initialize auth token if not previously set
        if let token = UserDefaults.standard.string(forKey:"authToken") {
            self._authToken = token
        } else {
            UserDefaults.standard.set(_authToken, forKey:"authToken")
        }
    }
    
    // singleton accessor
    class func shared() -> AppSettings {
        return sharedAppSettings
    }
    
    // username property
    var username : String {
        get {
            if let user = UserDefaults.standard.string(forKey:"username") {
                return user
            } else {
                return _username
            }
        }
        set(user) {
            UserDefaults.standard.set(user, forKey:"username")
        }
    }
    
    // authToken property
    var authToken : String {
        get {
            if let token = UserDefaults.standard.string(forKey:"authToken") {
                return token
            } else {
                return _authToken
            }
        }
        set(token) {
            UserDefaults.standard.set(token, forKey:"authToken")
        }
    }
}
