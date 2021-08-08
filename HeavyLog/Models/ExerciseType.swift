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

    var name: LocalizedStringKey {
        switch self {
        case .push:
            return LocalizedString.common_exerciseType_push.key
        case .pull:
            return LocalizedString.common_exerciseType_pull.key
        case .static:
            return LocalizedString.common_exerciseType_static.key
        case .unknown:
            return LocalizedString.error_enum_unknown.key
        }
    }
}

extension ExerciseType: Decodable {}

extension ExerciseType: UnknownValueSupport {
    static let unknownCase: ExerciseType = .unknown
}
