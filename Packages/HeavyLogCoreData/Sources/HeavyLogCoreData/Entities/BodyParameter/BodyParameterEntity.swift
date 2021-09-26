//
//  BodyParameterEntity.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import CoreData
import Foundation

@objc(BodyParameterEntity) public class BodyParameterEntity: NSManagedObject, Entity {

    @NSManaged var parameter_: String
    @NSManaged public internal(set) var date: Date
    @NSManaged public internal(set) var value: Double

    public internal(set) var parameter: BodyParameter {
        get { .getCase(for: parameter_) }
        set { parameter_ = newValue.rawValue }
    }
}

extension BodyParameterEntity: Identifiable {}
