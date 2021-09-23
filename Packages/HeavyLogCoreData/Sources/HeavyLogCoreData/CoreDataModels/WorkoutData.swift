//
//  WorkoutData.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import Foundation

public struct WorkoutData {
    let title: String
    let notes: String?
    let startDate: Date
    let endDate: Date
    var efforts: [EffortData]
    let rate: WorkoutRate

    public init(title: String, notes: String?, startDate: Date, endDate: Date, efforts: [EffortData], rate: WorkoutRate) {
        self.title = title
        self.notes = notes
        self.startDate = startDate
        self.endDate = endDate
        self.efforts = efforts
        self.rate = rate
    }
}

// MARK: - Codable

public extension WorkoutData {
    var toCodable: Coding {
        Coding(title: title, notes: notes, startDate: startDate, endDate: endDate, efforts: efforts.map { $0.toCodable() }, rate: rate)
    }

    struct Coding: Codable {
        let title: String
        let notes: String?
        let startDate: Date
        let endDate: Date
        var efforts: [EffortData.Coding]
        let rate: WorkoutRate
    }
}


// MARK: - Sample Data

public extension WorkoutData {
    static let sample1 = WorkoutData(title: "FBW A", notes: "This is a sample workout.", startDate: Date(), endDate: Date().addingTimeInterval(.init(100)), efforts: [], rate: .good)
    static let sample2 = WorkoutData(title: "PUSH B", notes: nil, startDate: Date(), endDate: Date().addingTimeInterval(.init(300)), efforts: [], rate: .bad)
}
