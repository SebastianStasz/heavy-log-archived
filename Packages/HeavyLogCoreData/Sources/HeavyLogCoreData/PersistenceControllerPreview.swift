//
//  File.swift
//  
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import Foundation

public extension PersistenceController {

    static var previewEmpty: PersistenceController {
        let persistenceController = PersistenceController(inMemory: true)
        persistenceController.save()
        return persistenceController
    }

    static var previewWithData: PersistenceController {
        let persistenceController = PersistenceController(inMemory: true)
        persistenceController.save()
        return persistenceController
    }
}
