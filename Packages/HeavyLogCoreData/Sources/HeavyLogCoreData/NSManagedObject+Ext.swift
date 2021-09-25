//
//  NSManagedObject+Ext.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import CoreData
import Foundation
import SwiftUI

public protocol EntityFilter {
    var get: NSPredicate { get }
}

public protocol EntitySort {
    associatedtype Entity: NSManagedObject

    var get: SortDescriptor<Entity> { get }
}

extension EntitySort {
    var asNSSortDescriptor: NSSortDescriptor {
        NSSortDescriptor(get)
    }
}

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

extension NSManagedObject {

    /// Returns a description of search criteria used to retrieve data from a persistent store.
    /// - Parameters:
    ///   - sortDescriptors: The sort descriptors of the fetch request.
    ///   - predicate: The predicate of the fetch request.
    /// - Returns: A description of search criteria as `NSFetchRequest`.
    public static func nsFetchRequest<T: NSManagedObject>(sortDescriptors: [NSSortDescriptor] = [], predicate: NSPredicate? = nil) -> NSFetchRequest<T> {
        let name = String(describing: type(of: T.self)).replacingOccurrences(of: ".Type", with: "")
        let request = NSFetchRequest<T>(entityName: name)
        request.sortDescriptors = sortDescriptors
        request.predicate = predicate
        return request
    }

    /// Initializes a managed object from an entity description and inserts it into the specified managed object context.
    /// -  Use this init to avoid "Multiple NSEntityDescriptions Claim NSManagedObject Subclass" warning in unit testing.
    convenience init(in context: NSManagedObjectContext) {
        let name = String(describing: type(of: self))
        let entity = NSEntityDescription.entity(forEntityName: name, in: context)!
        self.init(entity: entity, insertInto: context)
    }

    /// Returns the managed object context with which the managed object is registered, if found.
    func getContext() -> NSManagedObjectContext? {
        guard let context = self.managedObjectContext else {
            assertionFailure("Context coulnd not be found in: \(self.description)")
            return nil
        }
        return context
    }

    /// Specifies an object that should be removed from its persistent store when changes are committed.
    func delete() {
        guard let context = getContext() else { return }
        context.delete(self)
    }
}

extension NSPredicate {
    static func allExcept<T: NSManagedObject>(_ entities: [T]) -> NSPredicate {
        NSPredicate(format: "NOT (SELF IN %@)", entities)
    }
}
