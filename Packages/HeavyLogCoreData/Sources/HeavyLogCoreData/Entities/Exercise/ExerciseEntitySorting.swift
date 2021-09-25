//
//  ExerciseEntitySorting.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension ExerciseEntity {

    enum Sort: EntitySort {
        case byName(SortOrder)

        public var get: SortDescriptor<ExerciseEntity> {
            switch self {
            case let .byName(order):
                return SortDescriptor(\ExerciseEntity.name, order: order)
            }
        }
    }
}
