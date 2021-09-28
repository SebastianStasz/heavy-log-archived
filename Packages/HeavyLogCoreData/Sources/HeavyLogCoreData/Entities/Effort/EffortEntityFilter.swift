//
//  EffortEntityFilter.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension EffortEntity {
    enum Filter: EntityFilter {

        public var nsPredicate: NSPredicate? {
            switch self {}
        }
    }
}
