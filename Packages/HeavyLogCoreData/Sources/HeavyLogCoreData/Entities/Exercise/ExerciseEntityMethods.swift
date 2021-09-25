//
//  ExerciseEntityMethods.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Combine
import CoreData
import Foundation
import Shared

public extension ExerciseEntity {

    @discardableResult static func create(in context: NSManagedObjectContext, exerciseData: ExerciseData, isUserExercise: Bool = true) -> ExerciseEntity? {
        guard checkIsIdCorrect(exerciseData.id, isUserExercise: isUserExercise) else { return nil }
        let exercise = ExerciseEntity(in: context)
        exercise.id_ = exerciseData.id
        exercise.isEditable = isUserExercise
        exercise.fillInData(data: exerciseData)
        return exercise
    }

    @discardableResult func modify(exerciseData: ExerciseData) -> ExerciseEntity {
        guard self.isEditable else {
            assertionFailure("Editing \"not editable\" exercise entity is not allowed.")
            return self
        }
        return fillInData(data: exerciseData)
    }

    static func loadStaticData(to context: NSManagedObjectContext, using apiService: APIProvider = APIService.shared) -> AnyCancellable {
        getExercisesData(using: apiService)
            .sink { completion in
                if case .failure(let error) = completion {
                    assertionFailure("Loading exercise data failed: \(error.error)")
                }
            } receiveValue: { exercises in
                _ = exercises.map { create(in: context, exerciseData: $0, isUserExercise: false) }
            }
    }

    static func getExerciseWithId(_ id: Int, from context: NSManagedObjectContext) -> ExerciseEntity? {
        let request: NSFetchRequest<ExerciseEntity> = ExerciseEntity.nsFetchRequest(predicate: Filter.withId(id).get)
        return try? context.fetch(request).first
    }
}

// MARK: - Helpers

private extension ExerciseEntity {

    @discardableResult private func fillInData(data: ExerciseData) -> ExerciseEntity {
        name_ = data.name
        shortName_ = data.shortName
        information_ = data.information
        difficulty = data.difficulty
        section = data.section
        type = data.type
        mainBodyPart = data.mainBodyPart
        additionalBodyParts = data.additionalBodyParts
        return self
    }

    static func getExercisesData(using apiService: APIProvider) -> AnyPublisher<[ExerciseData], AppError> {
        guard let url = Bundle.module.url(forResource: "exercisesData", withExtension: "json") else {
            fatalError("Failed to load exercisesData.json file.")
        }
        return apiService.getData(from: url)
    }

    static func checkIsIdCorrect(_ id: Int, isUserExercise: Bool) -> Bool {
        guard isUserExercise ? id < 0 : id >= 0 else {
            print(isUserExercise)
            print(id)
            assertionFailure("Id for exercise created by user should be negative. Id for exercise created from static data should be non-negative.")
            return false
        }
        return true
    }
}
