//
//  WorkoutEntitySorting.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension WorkoutEntity {
    enum Sort: EntitySort {
        case byDate(SortOrder = .forward)

        public var get: SortDescriptor<WorkoutEntity> {
            switch self {
            case let .byDate(order):
                return SortDescriptor(\WorkoutEntity.endDate, order: order)
            }
        }
    }
}
