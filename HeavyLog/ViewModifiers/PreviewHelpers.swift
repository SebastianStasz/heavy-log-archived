//
//  PreviewHelpers.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct SizeThatFits: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray.opacity(0.7))
            .previewLayout(.sizeThatFits)
    }
}

extension View {
    func previewSizeThatFits() -> some View {
        self.modifier(SizeThatFits())
    }
}
