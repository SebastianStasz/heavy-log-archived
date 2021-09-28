//
//  EntityFilter.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation

public protocol EntityFilter {
    var nsPredicate: NSPredicate? { get }
}
