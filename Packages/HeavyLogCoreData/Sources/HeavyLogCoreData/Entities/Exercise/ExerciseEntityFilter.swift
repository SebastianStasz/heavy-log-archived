//
//  ExerciseEntityFilter.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension ExerciseEntity {
    enum Filter: EntityFilter {
        case withId(Int)
        case withName(String)
        case notIncluding([ExerciseEntity])

        public var get: NSPredicate {
            switch self {
            case let .withId(id):
                return NSPredicate(format: "id_ == %@", id as CVarArg)
            case let .withName(name):
                return NSPredicate(format: "name_ == %@", name as CVarArg)
            case let .notIncluding(exercises):
                return NSPredicate.allExcept(exercises)
            }
        }
    }
}
