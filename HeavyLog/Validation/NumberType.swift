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

    func checkIsValid<T>(_ value: String) -> T? {
        switch self {
        case .integer:
            return Int(value) as? T
        case .double:
            return Double(value) as? T
        }
    }
}
