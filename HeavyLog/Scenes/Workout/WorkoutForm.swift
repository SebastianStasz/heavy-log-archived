//
//  WorkoutForm.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import HeavyLogCoreData
import Foundation

struct WorkoutForm {
    var title = ""
    let startDate = Date()
    var efforts: [EffortData] = []
    var endDate: Date? = nil
    var notes: String? = nil
    var rate: WorkoutRate? = nil
}
