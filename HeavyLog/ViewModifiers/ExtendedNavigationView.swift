//
//  ExtendedNavigationView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 27/07/2021.
//

import SwiftUI

private struct ExtendedNavigationView: ViewModifier {

    let title: LocalizedStringKey?
    let displayMode: NavigationBarItem.TitleDisplayMode

    func body(content: Content) -> some View {
        NavigationView {
            if let title = title {
                content
                    .navigationTitle(title)
                    .navigationBarTitleDisplayMode(displayMode)
            } else {
                content
            }
        }
    }
}

extension View {
    func embedInNavigationView(title: LocalizedStringKey? = nil, displayMode: NavigationBarItem.TitleDisplayMode = .automatic) -> some View {
        self.modifier(ExtendedNavigationView(title: title, displayMode: displayMode))
    }
}

