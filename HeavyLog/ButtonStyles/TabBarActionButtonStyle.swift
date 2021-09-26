//
//  TabBarActionButtonStyle.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Shared
import SwiftUI

struct TabBarActionButtonStyle: ButtonStyle {

    let isEnabled: Bool

    static private let linearGradient = Gradient(colors: [.white, .white, .accentRedLight])
    static private let actionBtnGradient = LinearGradient(gradient: Self.linearGradient, startPoint: .top, endPoint: .bottom)

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill(Self.actionBtnGradient)
                .scaleEffect(1.3)

            Circle()
                .foregroundColor(.accentRed)

            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.system(size: 26, weight: .medium))
                .rotationEffect(isEnabled ? Angle(degrees: 45) : .zero)
        }
        .animation(.easeInOut, value: 0.2)
    }
}
