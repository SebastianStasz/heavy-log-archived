//
//  BodyParameterEntityTests.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 22/08/2021.
//

import XCTest
@testable import HeavyLogCoreData

class BodyParameterEntityTests: XCTestCase, CoreDataSteps {

    var context = PersistenceController.previewEmpty.context

    override func setUpWithError() throws {
        context.reset()
        context = PersistenceController.previewEmpty.context
    }

    // MARK: - Tests

    func test_create_body_parameter_entity() throws {
        // Define body parameter data.
        let bodyParameterData = BodyParameterData.sampleChest

        // Before creating, there should not be any body parameters.
        try fetchRequestShouldReturnElements(0, for: BodyParameterEntity.self)

        // Create body parameter entity using defined data.
        let bodyParameterEntity = createBodyParameterEntity(data: bodyParameterData)

        // After creating, there should be one body parameter entity.
        try fetchRequestShouldReturnElements(1, for: BodyParameterEntity.self)

        // Verify that body parameter entity data is correct.
        try verifyBodyParameterEntityData(bodyParameterEntity, data: bodyParameterData)

        // Save context.
        try saveContext()
    }

    func test_modify_body_parameter_entity() throws {
        // Define initial body parameter data.
        let initialBodyParameterData = BodyParameterData.sampleChest

        // Defined modified body parameter data.
        let modifiedBodyParameterData = BodyParameterData.sampleHeight

        // Create body parameter entity using initial data.
        let bodyParameterEntity = createBodyParameterEntity(data: initialBodyParameterData)

        // Modify body parameter entity using modified data.
        bodyParameterEntity.modify(bodyParameterData: modifiedBodyParameterData)

        // Verify that data has been changed, parameter should be the same.
        try verifyModifiedBodyParameterEntityData(bodyParameterEntity, initialData: initialBodyParameterData, modifiedData: modifiedBodyParameterData)

        // Save context.
        try saveContext()
    }

    func test_delete_body_parameter_entity() throws {
        // Create body parameter entity using initial data.
        let bodyParameterEntity = createBodyParameterEntity(data: .sampleChest)

        // Delete body parameter entity.
        bodyParameterEntity.delete()

        // Verify that body parameter entity was deleted.
        try fetchRequestShouldReturnElements(0, for: BodyParameterEntity.self)

        // Save context.
        try saveContext()
    }

    func test_get_last_value() throws {
        // There are 3 weight parameters added in order.
        createWeightParamatersWithValues([70, 73, 75])

        // Last value for weight parameter should equal 75.
        try lastValueForWeightParameterShouldEqual(75)
    }


    func test_get_last_value_if_there_is_no_data() throws {
        // There is not weight parameter data available.
        // Last value for weight parameter should be nil.
        try lastValueForWeightParameterShouldEqual(nil)
    }

    func test_get_last_value_for_each_parameter() throws {
        // For each possible case, check if last value is being fetched properly.
        for parameter in BodyParameter.possibleCases {
            try checkIsLastValueFetchingProperly(for: parameter)
        }
    }
}

// MARK: - Steps

extension BodyParameterEntityTests {

    @discardableResult private func createBodyParameterEntity(data: BodyParameterData) -> BodyParameterEntity {
        BodyParameterEntity.create(in: context, bodyParameterData: data)
    }

    private func verifyBodyParameterEntityData(_ entity: BodyParameterEntity, data: BodyParameterData) throws {
        XCTAssertEqual(entity.parameter, data.parameter)
        XCTAssertEqual(entity.value, data.value)
        XCTAssertEqual(entity.date, data.date)
    }

    private func verifyModifiedBodyParameterEntityData(_ entity: BodyParameterEntity, initialData: BodyParameterData, modifiedData: BodyParameterData) throws {
        XCTAssertEqual(entity.parameter, initialData.parameter)
        XCTAssertEqual(entity.value, modifiedData.value)
        XCTAssertEqual(entity.date, modifiedData.date)
    }

    private func checkIsLastValueFetchingProperly(for parameter: BodyParameter) throws {
        createBodyParameterEntity(data: .init(parameter: parameter, value: 1))
        let lastValue = parameter.getLastValue(in: context)
        XCTAssertEqual(lastValue, 1)
    }

    private func createWeightParamatersWithValues(_ values: [Double]) {
        for value in values {
            createBodyParameterEntity(data: .init(parameter: .weight, value: value))
        }
    }

    private func lastValueForWeightParameterShouldEqual(_ value: Double?) throws {
        XCTAssertEqual(BodyParameter.weight.getLastValue(in: context), value)
    }
}
