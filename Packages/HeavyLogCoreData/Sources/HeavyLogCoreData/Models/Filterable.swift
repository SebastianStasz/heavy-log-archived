//
//  Filterable.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 28/09/2021.
//

import Foundation
import Shared

public protocol Filterable {
    var name: String { get }
}

public extension Filterable where Self: UnknownValueSupport {
    var filterName: String {
        switch self {
        case .unknownCase:
            return .common_all
        default:
            return name
        }
    }
}
