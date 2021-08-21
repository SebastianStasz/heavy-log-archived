//
//  Shape+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import SwiftUI


extension Shape {

    /// Fills this shape with a color.
    func fillColor(_ color: Color) -> some View {
        self.fill(color)
    }
}
