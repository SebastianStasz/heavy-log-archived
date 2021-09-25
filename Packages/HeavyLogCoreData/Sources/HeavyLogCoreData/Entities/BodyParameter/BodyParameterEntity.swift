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

    static func getLastValue(for parameter: BodyParameter, in context: NSManagedObjectContext) -> Double? {
        let request: NSFetchRequest<BodyParameterEntity> = BodyParameterEntity.nsFetchRequest(sortDescriptors: [Self.sortByDateNewest], predicate: parameter.predicate)
        request.fetchLimit = 1
        let result = try? context.fetch(request)
        return result?.first?.value
    }

    // MARK: - Helpers

    static private var sortByDateNewest: NSSortDescriptor {
        NSSortDescriptor(key: "date", ascending: false)
    }
}

extension BodyParameterEntity: Identifiable {}

extension BodyParameter {
    fileprivate var predicate: NSPredicate {
        NSPredicate(format: "parameter_ == %@", self.rawValue)
    }
}
