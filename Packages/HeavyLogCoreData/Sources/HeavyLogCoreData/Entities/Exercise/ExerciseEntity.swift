//
//  ExerciseEntity.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//
//

import CoreData
import Foundation

@objc(ExerciseEntity) public class ExerciseEntity: NSManagedObject, Entity {

    @NSManaged var nameKey: String
    @NSManaged var type_: String
    @NSManaged var section_: String
    @NSManaged var difficulty_: String
    @NSManaged var mainBodyPart_: String

    @NSManaged var shortName_: String?
    @NSManaged var information_: String?
    @NSManaged var additionalBodyParts_: String?

    @NSManaged var id_: Int
    @NSManaged var isEditable: Bool
    @NSManaged var efforts: Set<EffortEntity>
    @NSManaged var templates: Set<WorkoutTemplateEntity>
    @NSManaged public internal(set) var name: String

    public var shortName: String? {
        shortName_?.localize()
    }

    public var information: String? {
        information_?.localize()
    }

    public var numberOfEfforts: Int {
        efforts.count
    }

    public internal(set) var section: ExerciseSection {
        get { .getCase(for: section_) }
        set { section_ = newValue.rawValue }
    }

    public internal(set) var difficulty: Difficulty {
        get { .getCase(for: difficulty_) }
        set { difficulty_ = newValue.rawValue }
    }

    public internal(set) var type: ExerciseType {
        get { .getCase(for: type_) }
        set { type_ = newValue.rawValue }
    }

    public internal(set) var mainBodyPart: BodyPart {
        get { .getCase(for: mainBodyPart_) }
        set { mainBodyPart_ = newValue.rawValue }
    }

    public internal(set) var additionalBodyParts: [BodyPart]? {
        get { decodeBodyParts() }
        set { saveBodyParts(newValue) }
    }
}

// MARK: - Helpers

extension ExerciseEntity {
    private func decodeBodyParts() -> [BodyPart]? {
        guard let parts = additionalBodyParts_ else { return nil }
        let keys = parts.split(separator: ",").map { String($0) }
        let bodyParts = keys.map { BodyPart.getCase(for: $0) }
        return bodyParts
    }

    private func saveBodyParts(_ bodyParts: [BodyPart]?) {
        guard let bodyParts = bodyParts else { additionalBodyParts_ = nil ; return }
        let keys = bodyParts.map { $0.rawValue }.joined(separator: ",")
        additionalBodyParts_ = keys
    }
}

extension ExerciseEntity: Identifiable {}
