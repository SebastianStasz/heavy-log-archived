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

extension Difficulty: Pickerable {}
extension ExerciseType: Pickerable {}
extension ExerciseSection: Pickerable {}
