//
//  WorkoutTreeViewComponents.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import SwiftUI

extension WorkoutTreeView {

    // MARK: - Button Row

    struct ButtonRow: View {
        private let title: String
        private let action: () -> Void

        init(_ title: String, action: @escaping () -> Void) {
            self.title = title
            self.action = action
        }

        var body: some View {
            HStack(spacing: .spacingMedium) {
                Components.circle

                Button(title, action: action)
                    .buttonStyle(TextButtonStyle(.action))

                Spacer()
            }
        }
    }

    // MARK: - Helpers

    static var circle: some View {
        Circle().fillColor(.grayMedium).size(10)
    }

    static func spacingLine(_ height: CGFloat? = nil) -> some View {
        ZStack { circle.hidden() ; line }.frame(height: height)
    }

    private static var line: some View {
        Rectangle().fillColor(.grayMedium).frame(width: 1)
    }
}
