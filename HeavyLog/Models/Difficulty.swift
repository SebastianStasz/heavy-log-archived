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

    var name: String {
        switch self {
        case .easy:
            return LocalizedStringKey.common_difficulty_easy
        case .moderate:
            return LocalizedStringKey.common_difficulty_moderate
        case .hard:
            return LocalizedStringKey.common_difficulty_hard
        }
    }
}
