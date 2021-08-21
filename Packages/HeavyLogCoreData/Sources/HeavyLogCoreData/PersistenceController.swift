//
//  PersistenceController.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import Combine
import CoreData
import Foundation

public final class PersistenceController {
    static let shared = PersistenceController()

    private var cancellables: Set<AnyCancellable> = []
    private var container: NSPersistentContainer!

    public var context: NSManagedObjectContext {
        container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name:"HeavyLog", managedObjectModel: getNSManagedObjectModel())

        if inMemory { container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null") }

        container.loadPersistentStores { storeDescription, error in
            guard let error = error else { return }
            fatalError("Loading persistent stores error: \(error)")
        }

//        saveContextPublisher()
    }

    func save() {
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

    private func getModelURL() -> URL {
        guard let url = Bundle.module.url(forResource:"HeavyLog", withExtension: "momd") else {
            fatalError("Failed to find url for the resource HeavyLog.momd")
        }
        return url
    }

    private func getNSManagedObjectModel() -> NSManagedObjectModel {
        let modelURL = getModelURL()
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Failed to initialize managed object model from path: \(modelURL)")
        }
        return model
    }
}
