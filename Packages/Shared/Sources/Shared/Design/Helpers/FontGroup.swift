//
//  FontGroup.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 03/09/2021.
//

import SwiftUI

struct FontGroup: ViewModifier {

    var title: String

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: .spacingBig) {

            Text(title)
                .fontWeight(.light)
                .foregroundColor(.blue)
                .opacity(0.3)

            VStack(alignment: .leading, spacing: .spacingMedium) {
                content
            }
        }
    }
}

extension View {
    func fontGroup(_ title: String) -> some View {
        self.modifier(FontGroup(title: title))
    }
}
