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

    @NSManaged private var name_: String
    @NSManaged private var shortName_: String?
    @NSManaged private var information_: String?
    @NSManaged private var type_: String
    @NSManaged private var difficulty_: String
    @NSManaged private var mainBodyPart_: String
    @NSManaged private var additionalBodyParts_: String?

    @NSManaged private(set) var id_: Int
    @NSManaged private(set) var isEditable: Bool
    @NSManaged private(set) var efforts: [EffortEntity]

    var name: String {
        name_.localize()
    }

    var shortName: String? {
        shortName_?.localize()
    }

    var information: String? {
        information_?.localize()
    }

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
    static func create(in context: NSManagedObjectContext, data: Exercise, isUserExercise: Bool = true) -> ExerciseEntity? {
        guard checkIsIdCorrect(data.id, isUserExercise: isUserExercise) else { return nil }
        let exercise = ExerciseEntity(in: context)
        exercise.id_ = data.id
        exercise.isEditable = isUserExercise
        exercise.fillInData(data: data)
        return exercise
    }

    @discardableResult
    func modify(data: Exercise) -> ExerciseEntity {
        guard self.isEditable else {
            assertionFailure("Editing \"not editable\" exercise entity is not allowed.")
            return self
        }
        return fillInData(data: data)
    }

    @discardableResult
    private func fillInData(data: Exercise) -> ExerciseEntity {
        name_ = data.name
        shortName_ = data.shortName
        information_ = data.information
        difficulty = data.difficulty
        type = data.type
        mainBodyPart = data.mainBodyPart
        additionalBodyParts = data.additionalBodyParts
        return self
    }

    static func loadStaticData(to context: NSManagedObjectContext, using apiService: APIProvider = APIService.shared) -> AnyCancellable {
        getExercisesData(using: apiService)
            .sink { completion in
                if case .failure(let error) = completion {
                    assertionFailure("Loading exercise data failed: \(error.error)")
                }
            } receiveValue: { exercises in
                _ = exercises.map { create(in: context, data: $0, isUserExercise: false) }
            }
    }

    static private func getExercisesData(using apiService: APIProvider) -> AnyPublisher<[Exercise], AppError> {
        apiService.getData(fromFile: "exercisesData", withExtension: ".json")
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

    static private func checkIsIdCorrect(_ id: Int, isUserExercise: Bool) -> Bool {
        guard isUserExercise ? id < 0 : id >= 0 else {
            print(isUserExercise)
            print(id)
            assertionFailure("Id for exercise created by user should be negative. Id for exercise created from static data should be non-negative.")
            return false
        }
        return true
    }
}

extension ExerciseEntity: Identifiable {}
