//
//  ExerciseType.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

enum ExerciseType: String {
    case push
    case pull
    case `static`
    case unknown

    var name: String {
        nameLocalized.key.localize()
    }

    private var nameLocalized: LocalizedString {
        switch self {
        case .push:
            return LocalizedString.common_exerciseType_push
        case .pull:
            return LocalizedString.common_exerciseType_pull
        case .static:
            return LocalizedString.common_exerciseType_static
        case .unknown:
            return LocalizedString.error_enum_unknown
        }
    }
}

extension ExerciseType: Decodable {}

extension ExerciseType: UnknownValueSupport {
    static let unknownCase: ExerciseType = .unknown
}
