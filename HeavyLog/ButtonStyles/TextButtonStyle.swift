//
//  TextButtonStyle.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 26/07/2021.
//

import SwiftUI

struct TextButtonStyle: ButtonStyle {

    private let type: TextButton

    init(_ type: TextButton) {
        self.type = type
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .foregroundColor(type.color)
            .opacity(configuration.isPressed ? 0.4 : 1)
    }
}
