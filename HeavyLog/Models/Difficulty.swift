//
//  Difficulty.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

enum Difficulty: String {
    case easy
    case moderate
    case hard
    case unknown

    var name: String {
        nameLocalized.key.localize()
    }

    private var nameLocalized: LocalizedString {
        switch self {
        case .easy:
            return LocalizedString.common_difficulty_easy
        case .moderate:
            return LocalizedString.common_difficulty_moderate
        case .hard:
            return LocalizedString.common_difficulty_hard
        case .unknown:
            return LocalizedString.error_enum_unknown
        }
    }

    var color: Color {
        switch self {
        case .easy:
            return .accentGreenLight
        case .moderate:
            return .accentOrangeLight
        case .hard:
            return .accentRedLight
        case .unknown:
            return .primary
        }
    }
}

extension Difficulty: Decodable {}

extension Difficulty: UnknownValueSupport {
    static var unknownCase: Difficulty = .unknown
}
