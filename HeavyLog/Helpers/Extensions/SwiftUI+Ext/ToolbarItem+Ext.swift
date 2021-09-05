//
//  ToolbarItem+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

struct Toolbar {}

extension Toolbar {

    static func cancel(action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(.common_close) { action() }
        }
    }

    static func delete(action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            HStack {
                Button(.common_delete) { action() }
                    .buttonStyle(TextButtonStyle(.destructive))
                Spacer()
            }
        }
    }
}
