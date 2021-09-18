//
//  SetEntity+CoreDataClass.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 15/08/2021.
//
//

import CoreData
import Foundation

@objc(SetEntity) public class SetEntity: NSManagedObject {

    @NSManaged private(set) var reps: Int
    @NSManaged private(set) var weight: Double
    @NSManaged private(set) var effort: EffortEntity
}

// MARK: - Methods

extension SetEntity {

    @discardableResult static func create(in effort: EffortEntity, setData: SetData) -> SetEntity? {
        guard let context = effort.getContext() else { return nil }
        let set = SetEntity(in: context)
        set.effort = effort
        set.modify(setData: setData)
        return set
    }

    @discardableResult func modify(setData: SetData) -> SetEntity {
        reps = setData.reps
        weight = setData.weight
        return self
    }
}

extension SetEntity: Identifiable {}
