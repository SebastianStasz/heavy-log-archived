//
//  BodyParameterEntity.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import CoreData
import Foundation

@objc(BodyParameterEntity) public class BodyParameterEntity: NSManagedObject {

    @NSManaged private var parameter_: String
    @NSManaged private(set) var date: Date
    @NSManaged private(set) var value: Double

    private(set) var parameter: BodyParameter {
        get { .getCase(for: parameter_) }
        set { parameter_ = newValue.rawValue }
    }
}

extension BodyParameterEntity {

    // MARK: - Methods

    @discardableResult static func create(in context: NSManagedObjectContext, bodyParameterData: BodyParameterData) -> BodyParameterEntity {
        let bodyParameter = BodyParameterEntity(context: context)
        bodyParameter.parameter = bodyParameterData.parameter
        bodyParameter.modify(bodyParameterData: bodyParameterData)
        return bodyParameter
    }

    @discardableResult func modify(bodyParameterData: BodyParameterData) -> BodyParameterEntity {
        value = bodyParameterData.value
        date = bodyParameterData.date
        return self
    }

    // MARK: - Helpers
}

extension BodyParameterEntity: Identifiable {}
