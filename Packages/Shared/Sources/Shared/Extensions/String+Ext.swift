//
//  String+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 10/08/2021.
//

import SwiftUI

public extension String {
    
    /// Returns a localized string, using the main bundle.
    func localize() -> String {
        NSLocalizedString(self, comment: self)
    }

    static var common_ok: String {
        LocalizedString.common_ok.text
    }

    static var common_cancel: String {
        LocalizedString.common_cancel.text
    }

    static var workoutCreator_exerciseList_title: String {
        LocalizedString.workoutCreator_exerciseList_title.text
    }
}
