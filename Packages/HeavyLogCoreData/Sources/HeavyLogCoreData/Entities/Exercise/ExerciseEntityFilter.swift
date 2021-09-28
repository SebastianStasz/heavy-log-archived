//
//  ExerciseEntityFilter.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Foundation
import Shared

public extension ExerciseEntity {
    enum Filter: EntityFilter {
        case byId(Int)
        case byName(String)
        case byKind(Kind)
        case byDifficulty(Difficulty)
        case bySection(ExerciseSection)
        case byType(ExerciseType)
        case notIncluding([ExerciseEntity])

        public var nsPredicate: NSPredicate? {
            switch self {
            case let .byId(id):
                return NSPredicate(format: "id_ == %d", id)
            case let .byName(name):
                return name.isEmpty ? nil : NSPredicate(format: "name CONTAINS[cd] %@", name)
            case let .byKind(kind):
                return kind.nsPredicate
            case let .byDifficulty(difficulty):
                return difficulty == .unknown ? nil : NSPredicate(format: "difficulty_ == %@", difficulty.rawValue)
            case let .bySection(section):
                return section == .unknown ? nil : NSPredicate(format: "section_ == %@", section.rawValue)
            case let .byType(type):
                return type == .unknown ? nil : NSPredicate(format: "type_ == %@", type.rawValue)
            case let .notIncluding(exercises):
                return exercises == [] ? nil : NSPredicate.allExcept(exercises)
            }
        }

        public enum Kind {
            case all
            case builtIn
            case addedByUser

            public var nsPredicate: NSPredicate? {
                switch self {
                case .all:
                    return nil
                case .builtIn:
                    return NSPredicate(format: "isEditable == %d", false)
                case .addedByUser:
                    return NSPredicate(format: "isEditable == %d", true)
                }
            }
        }
    }
}
