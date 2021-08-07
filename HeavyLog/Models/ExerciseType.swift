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
        switch self {
        case .push:
            return LocalizedStringKey.common_exerciseType_push
        case .pull:
            return LocalizedStringKey.common_exerciseType_pull
        case .static:
            return LocalizedStringKey.common_exerciseType_static
        case .unknown:
            return LocalizedStringKey.error_enum_unknown
        }
    }
}

extension ExerciseType: UnknownValueSupport {
    static let unknownCase: ExerciseType = .unknown
}
