//
//  ExerciseEntity.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//
//

import Foundation
import CoreData

@objc(ExerciseEntity)
public class ExerciseEntity: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseEntity> {
        NSFetchRequest<ExerciseEntity>(entityName: "ExerciseEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var shortName: String?
    @NSManaged public var information: String?
    @NSManaged private var type_: String
    @NSManaged private var difficulty_: String
    @NSManaged private var mainBodyPart_: String
    @NSManaged private var additionalBodyParts_: String?

    var difficulty: Difficulty {
        get { .getCase(for: difficulty_) }
        set { difficulty_ = newValue.rawValue }
    }

    var type: ExerciseType {
        get { .getCase(for: type_) }
        set { type_ = newValue.rawValue }
    }

    var mainBodyPart: BodyPart {
        get { .getCase(for: mainBodyPart_) }
        set { mainBodyPart_ = newValue.rawValue }
    }

    var additionalBodyParts: [BodyPart]? {
        get { decodeBodyParts() }
        set { saveBodyParts(newValue) }
    }
}

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
