//
//  Pickerable.swift
//  Pickerable
//
//  Created by Sebastian Staszczyk on 27/09/2021.
//

import HeavyLogCoreData
import Foundation

protocol Pickerable where Self: Identifiable, Self: Hashable {
    var name: String { get }
}

extension Difficulty: Pickerable {
    var name: String { filterName }
}
extension ExerciseType: Pickerable {
    var name: String { filterName }
}
extension ExerciseSection: Pickerable {
    var name: String { filterName }
}
