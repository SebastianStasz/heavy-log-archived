//
//  Button+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

extension Button where Label == Text {

    /// Creates a button that generates its label from a localized string key.
    /// - Parameters:
    ///   - titleKey: The key for the button’s localized title, that describes the purpose of the button’s action.
    ///   - action: The action to perform when the user triggers the button.
    init(_ titleKey: LocalizedStringKey, action: @autoclosure @escaping () -> Void) {
        self.init(action: action) { Text(titleKey) }
    }

    /// Creates a button that generates its label from a string.
    /// - Parameters:
    ///   - title: A string that describes the purpose of the button’s action.
    ///   - action: The action to perform when the user triggers the button.
    init<S>(_ title: S, action: @autoclosure @escaping () -> Void) where S : StringProtocol{
        self.init(action: action) { Text(title) }
    }
}
