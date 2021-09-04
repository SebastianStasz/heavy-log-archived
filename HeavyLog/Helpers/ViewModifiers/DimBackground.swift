//
//  DimBackground.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

struct DimBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            content
        }
    }
}

extension View {
    func dimBackground() -> some View {
        self.modifier(DimBackground())
    }
}
