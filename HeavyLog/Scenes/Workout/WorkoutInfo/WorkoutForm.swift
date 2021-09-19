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
    var duration = "00:00"
    let startDate = Date()
    var endDate: Date? = nil
    var rate: WorkoutRate = .good

    var info: [BaseListRowViewData] {
        [BaseListRowViewData(title: "Date", value: startDate.string(format: .medium)),
         BaseListRowViewData(title: "Started", value: startDate.getTime()),
         BaseListRowViewData(title: "Duration", value: duration)]
    }

    mutating func updateDuration(for date: Date) {
        let duration = date.timeIntervalSince(startDate)
        self.duration = duration.asStringFormat
    }
}


// MARK: - Sample Data

extension WorkoutForm {
    static var sample1: WorkoutForm {
        var form = WorkoutForm()
        form.title = "FBW A"
        form.notes = "Sample workout notes."
        form.rate = .good
        return form
    }
}


