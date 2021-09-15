//
//  ValidationMessage.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 10/09/2021.
//

import Foundation
import Shared

enum ValidationMessage {
    case empty
    case invalid
    case tooShort
    case tooLong
    case tooSmall
    case tooBig

    var message: String {
        switch self {
        case .empty:
            return LocalizedString.validation_message_empty.text
        case .invalid:
            return LocalizedString.validation_message_invalid.text
        case .tooShort:
            return LocalizedString.validation_message_tooShort.text
        case .tooLong:
            return LocalizedString.validation_message_tooLong.text
        case .tooSmall:
            return LocalizedString.validation_message_tooSmall.text
        case .tooBig:
            return LocalizedString.validation_message_tooBig.text
        }
    }
}
