//
//  Entity.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import CoreData
import Foundation
import SwiftUI

public protocol Entity {
    associatedtype Filter: EntityFilter
    associatedtype Sort: EntitySort
}

public extension Entity where Sort.Entity == Self {
    static func all(sorting: [Sort] = [], filtering: [Filter]? = nil) -> FetchRequest<Self> {
        let sortDescriptors = sorting.map { $0.asNSSortDescriptor }
        let request: NSFetchRequest<Self> = Self.nsFetchRequest(sortDescriptors: sortDescriptors)
        if let predicates = filtering?.compactMap({ $0.nsPredicate }) {
//            if predicates.count == 1 { request.predicate = predicates.first }
            request.predicate = NSCompoundPredicate(type: .and, subpredicates: predicates)
        }
        return FetchRequest(fetchRequest: request)
    }
}

