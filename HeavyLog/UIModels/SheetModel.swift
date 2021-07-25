//
//  SheetModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

enum SheetModel: Int, Identifiable, View {
    case test

    var id: Int { rawValue }

    var body: some View {
        switch self {
        case .test:
            Text("Test")
        }
    }
}
