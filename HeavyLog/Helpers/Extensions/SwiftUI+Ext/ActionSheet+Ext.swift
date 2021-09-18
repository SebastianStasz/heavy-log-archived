//
//  ActionSheet+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 18/09/2021.
//

import SwiftUI

extension ActionSheet {
    init(title: String = "", message: String, buttons: [ActionSheet.Button]) {
        self.init(title: Text(title), message: Text(message), buttons: buttons)
    }
}

extension ActionSheet.Button {
    static func `default`(_ text: String, action: @autoclosure @escaping () -> Void) -> ActionSheet.Button {
        .default(Text(text), action: action)
    }
}
