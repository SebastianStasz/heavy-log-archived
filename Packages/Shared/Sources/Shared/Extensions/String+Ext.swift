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
}
