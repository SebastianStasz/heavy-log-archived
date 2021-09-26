//
//  SetEntity+CoreDataClass.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 15/08/2021.
//
//

import CoreData
import Foundation

@objc(SetEntity) public class SetEntity: NSManagedObject, Entity {

    @NSManaged var effort: EffortEntity
    @NSManaged public internal(set) var reps: Int
    @NSManaged public internal(set) var weight: Double
}

extension SetEntity: Identifiable {}
