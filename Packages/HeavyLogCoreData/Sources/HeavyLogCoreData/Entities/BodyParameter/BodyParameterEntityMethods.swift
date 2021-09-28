//
//  BodyParameterEntityMethods.swift.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import CoreData
import Foundation

public extension BodyParameterEntity {

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
        let request: NSFetchRequest<BodyParameterEntity> = BodyParameterEntity.nsFetchRequest(sortDescriptors: [Sort.byDate().asNSSortDescriptor], predicate: Filter.byParameter(parameter).nsPredicate)
        request.fetchLimit = 1
        let result = try? context.fetch(request)
        return result?.first?.value
    }
}
