//
//  BaseButtonSize.swift
//  BaseButtonSize
//
//  Created by Sebastian Staszczyk on 26/09/2021.
//

import SwiftUI

enum BaseButtonSize {
    case medium
    case big

    var size: CGFloat {
        switch self {
        case .medium:
            return 40
        case .big:
            return 55
        }
    }

    var textCase: Text.Case? {
        switch self {
        case .medium:
            return nil
        case .big:
            return .uppercase
        }
    }
}
