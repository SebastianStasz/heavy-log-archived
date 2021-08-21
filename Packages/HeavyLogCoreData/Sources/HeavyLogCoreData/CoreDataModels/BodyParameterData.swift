//
//  BodyParameterData.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import Foundation

public struct BodyParameterData {
    let parameter: BodyParameter
    let value: Double
    let date = Date()
}

// MARK: - Sample Data

public extension BodyParameterData {
    static let sampleHeight = BodyParameterData(parameter: .height, value: 178)
    static let sampleWeight = BodyParameterData(parameter: .weight, value: 83)
    static let sampleChest = BodyParameterData(parameter: .chest, value: 90)
}
