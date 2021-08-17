//
//  PersistenceController.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import Combine
import CoreData
import Foundation

public final class PersistenceController {
    static let shared = PersistenceController()

    private var cancellables: Set<AnyCancellable> = []
    private let container: NSPersistentContainer

    public var context: NSManagedObjectContext {
        container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "HeavyLog")

        if inMemory { container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null") }

        container.loadPersistentStores { storeDescription, error in
            guard let error = error else { return }
            fatalError("Loading persistent stores error: \(error)")
        }

//        saveContextPublisher()
    }

    private func save() {
        do { try context.save() }
        catch let error { fatalError("Saving context error: \(error)") }
    }

    private func saveContextPublisher() {
       NotificationCenter.default
          .publisher(for: .NSManagedObjectContextObjectsDidChange, object: context)
          .debounce(for: .seconds(10), scheduler: DispatchQueue.main)
          .sink { [weak self] notification in self?.save() }
          .store(in: &cancellables)
    }
}

// MARK: -- Preview

public extension PersistenceController {

    static var preview: PersistenceController {
        let persistenceController = PersistenceController(inMemory: true)
        persistenceController.save()
        return persistenceController
    }
}
