//
//  BaseButtonStyle.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

struct BaseButtonStyle: ButtonStyle {

    private let style: BaseButton

    init(_ style: BaseButton) {
        self.style = style
    }

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: .cornerRadiusBase)
                .fill(style.backgroundColor)

            configuration.label.textBodyBold
                .foregroundColor(style.textColor)
        }
        .opacity(configuration.isPressed ? 0.75 : 1)
        .frame(height: 40)
    }
}
