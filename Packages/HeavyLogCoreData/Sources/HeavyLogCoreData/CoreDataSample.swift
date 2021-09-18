//
//  File.swift
//  
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import CoreData
import Foundation

public struct CoreDataSample {}

public extension CoreDataSample {
    static func createSampleExerciseEntities(in context: NSManagedObjectContext) -> [String: ExerciseEntity] {
        let benchPress = ExerciseEntity.create(in: context, exerciseData: .sampleBenchPress)!
        let classicDeadlift = ExerciseEntity.create(in: context, exerciseData: .sampleClassicDeadlift)!
        let overheadPress = ExerciseEntity.create(in: context, exerciseData: .sampleOverheadPress)!
        let pullupsOverhand = ExerciseEntity.create(in: context, exerciseData: .samplePullupsOverhand)!

        return [
            "benchPress": benchPress,
            "classicDeadlift": classicDeadlift,
            "overheadPress": overheadPress,
            "pullupsOverhand": pullupsOverhand,
        ]
    }

    static func createSampleWorkoutTemplates(in context: NSManagedObjectContext) {
        WorkoutTemplateEntity.create(in: context, data: .sample1)
        WorkoutTemplateEntity.create(in: context, data: .sample2)
    }
}
