//
//  AlertModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

enum AlertModel: Int {
    case test

    var body: Alert {
        switch self {
        case .test:
            return Alert(title: Text("Test"))
        }
    }
}

extension AlertModel: Identifiable {
    var id: Int { rawValue }
}

