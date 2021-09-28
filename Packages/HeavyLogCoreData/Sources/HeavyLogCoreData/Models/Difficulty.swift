//
//  Difficulty.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI
import Shared

public enum Difficulty: String {
    case easy
    case moderate
    case hard
    case unknown

    public var name: String {
        nameLocalized.key.localize()
    }

    public var color: Color {
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
}

extension Difficulty: Decodable {}
extension Difficulty: CaseIterable {}
extension Difficulty: Filterable {}

extension Difficulty: Identifiable {
    public var id: String { rawValue }
}

extension Difficulty: UnknownValueSupport {
    public static var unknownCase: Difficulty = .unknown
}
