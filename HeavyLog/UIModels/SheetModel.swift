//
//  SheetModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

enum SheetModel: Int, View {
    case test

    var body: some View {
        switch self {
        case .test:
            Text("Test")
        }
    }
}

extension SheetModel: Identifiable {
    var id: Int { rawValue }
}
