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

public extension Entity where Self: NSManagedObject {
    static func all(sorting: [Sort] = [], filtering: [Filter]? = nil) -> FetchRequest<Self> {
        let request: FetchRequest<Self> = FetchRequest(fetchRequest: Self.nsFetchRequest())
        let sortDescriptors = sorting.map { $0.get } as! [SortDescriptor<Self>]
        request.wrappedValue.sortDescriptors = sortDescriptors
        if let predicates = filtering?.map({ $0.get }) {
            request.wrappedValue.nsPredicate = NSCompoundPredicate(type: .and, subpredicates: predicates)
        }
        return request
    }
}

