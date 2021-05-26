//
//  Auth.swift
//  YUP253
//
//  Created by Stephen Gomez-Fox on 5/26/21.
//

import Foundation

enum Auth: UInt16 {
    case None =               0x000
    case ViewEvents =         0x001
    case ViewHighlights =     0x002
    case ViewFeed =           0x004
    case ModifyEvents     =   0x008
    case ModifyHighlights =   0x128
    case ParentalAuthority =  0x256

}
