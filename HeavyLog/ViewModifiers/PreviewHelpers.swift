//
//  PreviewHelpers.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct SizeThatFits: ViewModifier {

    var backgroundColor: Color?

    func body(content: Content) -> some View {
        content
            .padding()
            .background(backgroundColor ?? Color.gray.opacity(0.7))
            .previewLayout(.sizeThatFits)
    }
}

extension View {
    func previewSizeThatFits(backgroundColor: Color? = nil) -> some View {
        self.modifier(SizeThatFits(backgroundColor: backgroundColor))
    }
}
