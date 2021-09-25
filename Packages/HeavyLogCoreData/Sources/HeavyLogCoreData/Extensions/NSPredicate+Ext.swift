//
//  NSPredicate+Ext.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import CoreData

extension NSPredicate {

    /// Returns NSPredicate to not including specified entities.
    static func allExcept<T: NSManagedObject>(_ entities: [T]) -> NSPredicate {
        NSPredicate(format: "NOT (SELF IN %@)", entities)
    }
}
