//
//  BodyParameterEntityFilter.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public extension BodyParameterEntity {
    enum Filter: EntityFilter {
        case byParameter(BodyParameter)

        public var nsPredicate: NSPredicate? {
            switch self {
            case let .byParameter(parameter):
                return NSPredicate(format: "parameter_ == %@", parameter.rawValue)
            }
        }
    }
}
