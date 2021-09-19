//
//  WorkoutCreatorHelper.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/09/2021.
//

import Foundation

protocol WorkoutCreatorHelper {
    typealias Tab = WorkoutCreator
    typealias Effort = WorkoutTreeData.Effort
    typealias WorkoutSet = WorkoutTreeData.Set
    typealias WeightRow = WorkoutTreeData.WeightRow
}

extension WorkoutCreatorHelper {
    var controller: AppController {
        AppController.shared
    }
}
