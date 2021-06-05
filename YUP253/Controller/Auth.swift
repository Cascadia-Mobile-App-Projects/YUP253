//
//  Auth.swift
//  YUP253
//
//  Created by Stephen Gomez-Fox on 5/26/21.
//

import Foundation




// OptionSet for
struct Auth: OptionSet, Codable {

    let rawValue: Int
    static let None =               Auth([])
    static let ViewEvents =         Auth(rawValue: 1 << 1) // bit rotation = 1
    static let ViewHighlights =     Auth(rawValue: 1 << 2) // = 2
    static let ViewFeed =           Auth(rawValue: 1 << 3) // = 4
    static let ModifyEvents     =   Auth(rawValue: 1 << 4) // = 8
    static let ModifyHighlights =   Auth(rawValue: 1 << 5) // = 16
    static let ParentalAuthority =  Auth(rawValue: 1 << 6) // = 32
    
}

extension Auth {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let optionName = try container.decode(String.self)
        guard let auth = Auth.mapping[optionName] else {
            let context = DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Authentication type not recognized: \(optionName)")
            throw DecodingError.valueNotFound(String.self, context)
        }
        self = auth
    }

    private static let mapping: [String : Auth] = [
        "None" : .None,
        "ViewEvents" : .ViewEvents,
        "ViewHighlights" : .ViewHighlights,
        "ViewFeed" : .ViewFeed,
        "ModifyEvents" : .ModifyEvents,
        "ModifyHighlights" : .ModifyHighlights,
        "ParentalAuthority" : .ParentalAuthority,
    ]

}

