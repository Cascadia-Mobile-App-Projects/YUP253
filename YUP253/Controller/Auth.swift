//
//  Auth.swift
//  YUP253
//
//  Created by Stephen Gomez-Fox on 5/26/21.
//

import Foundation




// OptionSet for
struct Auth: OptionSet, Encodable {

    let rawValue: Int
    static let None =               Auth([])
    static let ViewEvents =         Auth(rawValue: 1 << 1) // bit rotation = 1
    static let ViewHighlights =     Auth(rawValue: 1 << 2) // = 2
    static let ViewFeed =           Auth(rawValue: 1 << 3) // = 4
    static let ModifyEvents     =   Auth(rawValue: 1 << 4) // = 8
    static let ModifyHighlights =   Auth(rawValue: 1 << 5) // = 16
    static let ParentalAuthority =  Auth(rawValue: 1 << 6) // = 32
    
}

extension Auth : Decodable {
    
    private static let mapping: [String : Auth] = [
        "None" : .None,
        "ViewEvents" : .ViewEvents,
        "ViewHighlights" : .ViewHighlights,
        "ViewFeed" : .ViewFeed,
        "ModifyEvents" : .ModifyEvents,
        "ModifyHighlights" : .ModifyHighlights,
        "ParentalAuthority" : .ParentalAuthority,
    ]
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var optionName = ""
        var auth : Auth = []
        do {
            while !container.isAtEnd {
                optionName = try container.decode(String.self)
                if let permission = Auth.mapping[optionName] {
                    auth.insert(permission)
                } else {
                    print("unknown permission: \(optionName)")
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        self = auth
    }

}

