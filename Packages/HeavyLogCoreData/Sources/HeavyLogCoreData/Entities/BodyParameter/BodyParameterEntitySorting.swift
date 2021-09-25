//
//  BodyParameterEntitySorting.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension BodyParameterEntity {

    enum Sort: EntitySort {
        case byDate(SortOrder = .forward)

        public var get: SortDescriptor<Entity> {
            switch self {
            case let .byDate(order):
                return SortDescriptor(\Entity.date, order: order)
            }
        }

        public typealias Entity = BodyParameterEntity
    }
}
