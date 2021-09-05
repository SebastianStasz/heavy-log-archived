//
//  Form+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 05/09/2021.
//

import SwiftUI

extension Form {

    /// Removes default form style.
    func plainStyle() -> some View {
        self
            .padding(.horizontal, -20)
            .padding(.top, -91)
    }
}
