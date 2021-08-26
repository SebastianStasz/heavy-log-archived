//
//  View+Navigation.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 28/07/2021.
//


import SwiftUI

extension View {

    func onNavigation(_ action: @escaping () -> Void) -> some View {
        self.contentShape(Rectangle())
            .onTapGesture { action() }
    }

    func navigation<Item, Destination: View>(item: Binding<Item?>, @ViewBuilder destination: (Item) -> Destination) -> some View {
        let isActive = Binding(
            get: { item.wrappedValue != nil },
            set: { if !$0 { item.wrappedValue = nil } }
        )
        return navigation(isActive: isActive) {
            item.wrappedValue.map(destination)
        }
    }

    func navigation<Destination: View>(isActive: Binding<Bool>, @ViewBuilder destination: () -> Destination) -> some View {
        overlay(NavigationLink(destination: destination(), isActive: isActive) {})
    }
}
