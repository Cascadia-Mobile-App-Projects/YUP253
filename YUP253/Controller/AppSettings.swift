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
    private var _token = ""
    private var _userDetails = UserDetails()
    private var _permissions = Auth()
    private var _isLoggedIn = false
    
    // private initializer; initialize with default property values
    private init() {
        // initialize username if not previously set
        if let user = UserDefaults.standard.string(forKey:"username") {
            self._username = user
        } else {
            UserDefaults.standard.set(_username, forKey:"username")
        }
        
        // initialize auth token if not previously set
        if let token = UserDefaults.standard.string(forKey:"token") {
            self._token = token
        } else {
            UserDefaults.standard.set(_token, forKey:"token")
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
        set(uname) {
            UserDefaults.standard.set(uname, forKey:"username")
        }
    }
    
    // token property
    var token : String {
        get {
            if let token = UserDefaults.standard.string(forKey:"token") {
                return token
            } else {
                return _token
            }
        }
        set(token) {
            UserDefaults.standard.set(token, forKey:"token")
        }
    }
    var user : UserDetails {
        get {
            return _userDetails
        }
        set(value) {
            
            _userDetails = value
            _isLoggedIn = true
        }
    }
    
    var permissions : Auth {
        get {
            return _permissions
        }
        set(auth) {
            _permissions = auth
        }
    }
    
    var isLoggedIn : Bool {
        get {
            return _isLoggedIn
        }
        set {
            _isLoggedIn = true
        }
        
        
    }
}
