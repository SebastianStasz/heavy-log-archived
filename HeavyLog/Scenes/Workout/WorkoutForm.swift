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
    var notes = ""
    let startDate = Date()
    var efforts: [EffortData] = []
    var endDate: Date? = nil
    var rate: WorkoutRate = .unknown

    var currentDate = Date()

    var info: [BaseListRowViewData] {
        [BaseListRowViewData(title: "Date", value: startDate.string(format: .medium)),
         BaseListRowViewData(title: "Started", value: startDate.getTime()),
         BaseListRowViewData(title: "Duration", value: Date(timeIntervalSinceNow: startDate.timeIntervalSinceReferenceDate).getTime()),
        ]
    }
}

extension WorkoutForm {
    static func sample(efforts: [EffortData]) -> WorkoutForm {
        var form = WorkoutForm()
        form.title = "FBW A"
        form.notes = "Sample workout notes."
        form.rate = .good
        form.efforts = efforts
        return form
    }
}


