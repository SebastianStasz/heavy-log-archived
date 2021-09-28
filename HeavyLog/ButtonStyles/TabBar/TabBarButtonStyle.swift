//
//  TabBarButtonStyle.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Shared
import SwiftUI

struct TabBarButtonStyle: ButtonStyle {
    var image: Image
    var isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        image
            .scaledToFit(height: 18)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(isSelected ? .accentRed : .grayMedium)
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
            .animation(.easeInOut, value: 0.1)
            .contentShape(Circle())
    }
}

// MARK: - Initializers

extension TabBarButtonStyle {
    init(for tab: TabBarModel, isSelected: Bool) {
        let image = Image(systemName: tab.icon)
        self.init(image: image, isSelected: isSelected)
    }
}

