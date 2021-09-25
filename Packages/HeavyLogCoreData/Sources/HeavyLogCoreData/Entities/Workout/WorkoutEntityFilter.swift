//
//  WorkoutEntityFilter.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension WorkoutEntity {
    enum Filter: EntityFilter {
        case withName(String)

        public var get: NSPredicate {
            switch self {
            case let .withName(name):
                return NSPredicate(format: "name == %@", name as CVarArg)
            }
        }
    }
}
