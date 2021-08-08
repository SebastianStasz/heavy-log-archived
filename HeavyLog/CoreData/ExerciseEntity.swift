//
//  ExerciseEntity.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//
//

import Combine
import Foundation
import CoreData

@objc(ExerciseEntity)
public class ExerciseEntity: NSManagedObject {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<ExerciseEntity> {
        NSFetchRequest<ExerciseEntity>(entityName: "ExerciseEntity")
    }

    @NSManaged private var type_: String
    @NSManaged private var difficulty_: String
    @NSManaged private var mainBodyPart_: String
    @NSManaged private var additionalBodyParts_: String?

    @NSManaged private(set) var name: String
    @NSManaged private(set) var shortName: String?
    @NSManaged private(set) var information: String?
    @NSManaged private(set) var isEditable: Bool

    private(set) var difficulty: Difficulty {
        get { .getCase(for: difficulty_) }
        set { difficulty_ = newValue.rawValue }
    }

    private(set) var type: ExerciseType {
        get { .getCase(for: type_) }
        set { type_ = newValue.rawValue }
    }

    private(set) var mainBodyPart: BodyPart {
        get { .getCase(for: mainBodyPart_) }
        set { mainBodyPart_ = newValue.rawValue }
    }

    private(set) var additionalBodyParts: [BodyPart]? {
        get { decodeBodyParts() }
        set { saveBodyParts(newValue) }
    }
}

extension ExerciseEntity {

    @discardableResult
    static func create(in context: NSManagedObjectContext, data: Exercise, isEditable: Bool = true) -> ExerciseEntity {
        let exercise = ExerciseEntity(context: context)
        exercise.isEditable = isEditable
        exercise.modify(data: data)
        return exercise
    }

    @discardableResult
    func modify(data: Exercise) -> ExerciseEntity {
        self.name = data.name
        self.shortName = data.shortName
        self.information = data.information
        self.difficulty = data.difficulty
        self.type = data.type
        self.mainBodyPart = data.mainBodyPart
        self.additionalBodyParts = data.additionalBodyParts
        return self
    }

    static func loadStaticData(to context: NSManagedObjectContext, using apiService: APIProvider = APIService.shared) -> AnyCancellable {
        getExercisesData(using: apiService)
            .sink { completion in
                if case .failure(let error) = completion {
                    assertionFailure("Loading exercise data failed: \(error.error)")
                }
            } receiveValue: { exercises in
                _ = exercises.map { create(in: context, data: $0) }
            }
    }

    static private func getExercisesData(using apiService: APIProvider) -> AnyPublisher<[Exercise], AppError> {
        apiService.getData(fromFile: "exercisesData", withExtension: ".json")
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
