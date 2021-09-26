//
//  ExerciseEntityFilter.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation
import Shared

public extension ExerciseEntity {
    enum Filter: EntityFilter {
        case builtIn
        case addedByUser
        case withId(Int)
        case withName(String)
        case notIncluding([ExerciseEntity])

        public var get: NSPredicate {
            switch self {
            case .builtIn:
                return NSPredicate(format: "isEditable == %d", false)
            case .addedByUser:
                return NSPredicate(format: "isEditable == %d", true)
            case let .withId(id):
                return NSPredicate(format: "id_ == %d", id)
            case let .withName(name):
                return NSPredicate(format: "name CONTAINS[cd] %@", name as CVarArg)
            case let .notIncluding(exercises):
                return NSPredicate.allExcept(exercises)
            }
        }
    }
}
