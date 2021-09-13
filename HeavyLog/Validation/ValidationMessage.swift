//
//  ValidationMessage.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 10/09/2021.
//

import Foundation

enum ValidationMessage {
    case empty
    case invalid
    case tooShort
    case tooLong
    case toSmall
    case tooBig

    var message: String {
        switch self {
        case .empty:
            return "Value can not be empty."
        case .invalid:
            return "Value is invalid."
        case .tooShort:
            return "Value is too shrot."
        case .tooLong:
            return "Value is too long."
        case .toSmall:
            return "Value is too small."
        case .tooBig:
            return "Value is too big."
        }
    }
}
