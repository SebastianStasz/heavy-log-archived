//
//  EffortEntitySorting.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension EffortEntity {

    enum Sort: EntitySort {

        public var get: SortDescriptor<EffortEntity> {
            switch self {}
        }
    }
}
