//
//  WorkoutTemplateEntitySorting.swift.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension WorkoutTemplateEntity {

    enum Sort: EntitySort {
        case recentlyUsed(SortOrder = .reverse)

        public var get: SortDescriptor<WorkoutTemplateEntity> {
            switch self {
            case let .recentlyUsed(order):
                return SortDescriptor(\Entity.lastUse, order: order)
            }
        }
    }

    typealias Entity = WorkoutTemplateEntity
}
