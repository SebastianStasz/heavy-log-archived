//
//  TextButton.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 05/09/2021.
//

import SwiftUI

enum TextButton {
    case action
    case destructive

    var color: Color {
        switch self {
        case .action:
            return .actionPrimary
        case .destructive:
            return .accentRed
        }
    }
}

