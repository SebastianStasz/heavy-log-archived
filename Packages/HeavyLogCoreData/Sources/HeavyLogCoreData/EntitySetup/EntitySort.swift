//
//  EntitySort.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import CoreData
import Foundation

public protocol EntitySort {
    associatedtype Entity: NSManagedObject

    var get: SortDescriptor<Entity> { get }
}

extension EntitySort {
    var asNSSortDescriptor: NSSortDescriptor {
        NSSortDescriptor(get)
    }
}
