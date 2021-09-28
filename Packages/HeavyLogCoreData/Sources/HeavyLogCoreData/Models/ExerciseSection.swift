//
//  ExerciseSection.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import Foundation
import Shared

public enum ExerciseSection: String {
    case upper
    case lower
    case global
    case unknown

    public var name: String {
        nameLocalized.key.localize()
    }

    private var nameLocalized: LocalizedString {
        switch self {
        case .upper:
            return LocalizedString.common_exerciseSection_upper
        case .lower:
            return LocalizedString.common_exerciseSection_lower
        case .global:
            return LocalizedString.common_exerciseSection_global
        case .unknown:
            return LocalizedString.error_enum_unknown
        }
    }
}

extension ExerciseSection: Decodable {}
extension ExerciseSection: CaseIterable {}

extension ExerciseSection: Identifiable {
    public var id: String { rawValue }
}

extension ExerciseSection: UnknownValueSupport {
    public static var unknownCase: ExerciseSection = .unknown
}
