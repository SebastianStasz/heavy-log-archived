//
//  WorkoutEntity+CoreDataClass.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//
//

import CoreData
import Foundation
import SwiftUI

@objc(WorkoutEntity) public class WorkoutEntity: NSManagedObject, Entity {
    
    @NSManaged public internal(set) var title: String
    @NSManaged public internal(set) var startDate: Date
    @NSManaged public internal(set) var endDate: Date
    @NSManaged public internal(set) var notes: String?
    @NSManaged public internal(set) var efforts: Set<EffortEntity>
    @NSManaged internal var rate_: String

    public internal(set) var rate: WorkoutRate {
        get { .getCase(for: rate_) }
        set { rate_ = newValue.rawValue }
    }

    public var numberOfEfforts: Int {
        efforts.count
    }

    public var duration: String {
        startDate.distance(to: endDate).asHoursAndMinutes
    }
}

extension WorkoutEntity: Identifiable {}
