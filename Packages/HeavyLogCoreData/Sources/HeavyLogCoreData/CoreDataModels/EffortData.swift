//
//  EffortData.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import CoreData
import Foundation

public struct EffortData {
    public let exerciseId: Int
    public let exercise: ExerciseEntity
    public let sets: [SetData]

    public init(exercise: ExerciseEntity, sets: [SetData] = []) {
        self.exercise = exercise
        self.exerciseId = exercise.id_
        self.sets = sets
    }
}

extension EffortData: Identifiable {
    public var id: Int { exerciseId }
}


// MARK: - Sample Data

public extension EffortData {
    static func getSampleEfforts(in context: NSManagedObjectContext) -> [EffortData] {
        var efforts: [EffortData] = []

        let exerciseEntities = CoreDataSample.createSampleExerciseEntities(in: context)
        let exercises = ["benchPress", "classicDeadlift", "overheadPress", "pullupsOverhand"]
        let sets = [SetData.sampleBenchPress, SetData.sampleClassicDeadlift, SetData.sampleOverheadPress, SetData.samplePullupsOverhand]

        for (exercise, sets) in zip(exercises, sets) {
            efforts.append(EffortData.init(exercise: exerciseEntities[exercise]!, sets: sets))
        }

        return efforts
    }
}
