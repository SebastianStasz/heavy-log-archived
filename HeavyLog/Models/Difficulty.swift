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

    var name: LocalizedStringKey {
        switch self {
        case .easy:
            return LocalizedString.common_difficulty_easy.key
        case .moderate:
            return LocalizedString.common_difficulty_moderate.key
        case .hard:
            return LocalizedString.common_difficulty_hard.key
        case .unknown:
            return LocalizedString.error_enum_unknown.key
        }
    }
}

extension Difficulty: Decodable {}

extension Difficulty: UnknownValueSupport {
    static var unknownCase: Difficulty = .unknown
}
