//
//  WorkoutTemplateEntityMethods.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import CoreData
import Foundation

public extension WorkoutTemplateEntity {

    @discardableResult static func create(in context: NSManagedObjectContext, data: WorkoutTemplateData) -> WorkoutTemplateEntity {
        let template = WorkoutTemplateEntity(in: context)
        template.modify(using: data)
        template.timesUsed = Int64(data.timesUsed)
        template.lastUse = data.lastUse
        return template
    }

    func modify(using data: WorkoutTemplateData) {
        self.exercises = Set(data.exercises)
        self.name = data.name
    }

    func wasUsed() {
        self.timesUsed += 1
        self.lastUse = Date()
    }

    static func getRecentlyUsedTemplates(from context: NSManagedObjectContext, upTo quantity: Int) -> [WorkoutTemplateEntity]? {
        let request: NSFetchRequest<WorkoutTemplateEntity> = WorkoutTemplateEntity.nsFetchRequest(sortDescriptors: [Sort.recentlyUsed().asNSSortDescriptor])
        request.fetchLimit = quantity
        return try? context.fetch(request)
    }
}
