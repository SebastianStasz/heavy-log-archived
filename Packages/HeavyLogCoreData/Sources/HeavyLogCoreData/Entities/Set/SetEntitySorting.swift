//
//  SetEntitySorting.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension SetEntity {

    enum Sort: EntitySort {

        public var get: SortDescriptor<SetEntity> {
            switch self {}
        }
    }
}
