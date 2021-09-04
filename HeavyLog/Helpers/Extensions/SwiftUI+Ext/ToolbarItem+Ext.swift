//
//  ToolbarItem+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

extension ToolbarItem where ID == Void, Content == Button<Text> {

    static func cancel(action: @escaping () -> Void) -> ToolbarItem {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(.common_close, action: action())
        }
    }
}
