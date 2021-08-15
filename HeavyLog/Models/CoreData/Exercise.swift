//
//  Exercise.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import Foundation

struct Exercise {
    let id: Int
    let name: String
    let shortName: String?
    let information: String?
    let difficulty: Difficulty
    let type: ExerciseType
    let mainBodyPart: BodyPart
    let additionalBodyParts: [BodyPart]?
}

extension Exercise: Decodable {

    enum CodingKeys: String, CodingKey {
        case id, name, information, difficulty, type
        case shortName = "short_name"
        case mainBodyPart = "main_body_part"
        case additionalBodyParts = "additional_body_parts"
    }
}

// MARK: - Sample Data

extension Exercise {
    static let sampleBenchPress = Exercise(id: -1, name: "Bench press", shortName: nil, information: "An upper-body weight training exercise in which the trainee presses a weight upwards while lying on a weight training bench.", difficulty: .hard, type: .push, mainBodyPart: .chest, additionalBodyParts: [.anteriorDeltoid, .medialDeltoid, .triceps])
    
    static let sampleClassicDeadlift = Exercise(id: -2, name: "Classic deadlift", shortName: "CDL", information: "It is one of the three powerlifting exercises, along with the squat and bench press.", difficulty: .hard, type: .pull, mainBodyPart: .glutes, additionalBodyParts: [.lowerBack, .traps, .hamstrings])
}
