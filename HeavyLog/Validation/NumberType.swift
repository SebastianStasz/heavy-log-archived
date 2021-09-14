//
//  NumberType.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 13/09/2021.
//

import Foundation

enum NumberType {
    case integer
    case double

    func checkIsValid(_ value: String) -> Double? {
        switch self {
        case .integer:
            return checkIsInt(value)
        case .double:
            return checkIsDouble(value)
        }
    }

    private func checkIsInt(_ value: String) -> Double? {
        guard !value.contains(".") else { return nil }
        return Double(value)
    }

    private func checkIsDouble(_ value: String) -> Double? {
        var value = value
        value = value.replacingOccurrences(of: ",", with: ".")
        return Double(value)
    }
}

