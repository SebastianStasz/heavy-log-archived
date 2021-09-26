//
//  FetchRequest+Ext.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 26/09/2021.
//

import SwiftUI

public extension FetchRequest {
    func disableFiltering() {
        wrappedValue.nsPredicate = nil
    }

    func applyFiltering(_ predicates: [NSPredicate]) {
        let predicate = NSCompoundPredicate(type: .and, subpredicates: predicates)
        wrappedValue.nsPredicate = predicate
    }
}
