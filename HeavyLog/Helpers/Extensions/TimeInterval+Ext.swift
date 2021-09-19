//
//  TimeInterval+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/09/2021.
//

import Foundation

extension TimeInterval {
    var asStringFormat: String {
        let hours = Int(self / 3600)
        let minutes = Int(self / 60) - hours * 60
        return String(format: "%0.2d:%0.2d", hours, minutes)
    }
}
