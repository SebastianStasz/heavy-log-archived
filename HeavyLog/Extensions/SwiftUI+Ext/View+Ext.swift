//
//  View+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import SwiftUI

extension View {

    /// Positions this view within an invisible frame with infinite width and specified height.
    func infiniteWidth(maxHeight: CGFloat) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: maxHeight)
    }

    /// Positions this view within an invisible infinite frame.
    func infiniteFrame() -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    /// Layers the given view behind this view ignoring all safe area.
    func backgroundIgnoringSafeArea<T: View>(_ view: T) -> some View {
        self.background(view.edgesIgnoringSafeArea(.all))
    }
}
