//
//  TextButtonStyle.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 26/07/2021.
//

import SwiftUI

struct TextButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .foregroundColor(.actionPrimary)
            .opacity(configuration.isPressed ? 0.4 : 1)
    }
}
