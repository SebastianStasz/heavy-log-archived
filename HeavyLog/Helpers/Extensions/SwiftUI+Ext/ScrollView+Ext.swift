//
//  ScrollView+Ext.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 22/08/2021.
//

import SwiftUI

extension ScrollView {

    /// Flickering fix when using ScrollView with NavigationView.
    func fixFlickering() -> some View {
        self.fixFlickering { $0 }
    }

    private func fixFlickering<T: View>(@ViewBuilder configurator: @escaping (ScrollView<AnyView>) -> T) -> some View {
        GeometryReader { geo in
            GeometryReader { _ in
                configurator(
                    ScrollView<AnyView>(self.axes, showsIndicators: self.showsIndicators) {
                        AnyView(
                            VStack { self.content }
                                .padding(.top, geo.safeAreaInsets.top)
                                .padding(.bottom, geo.safeAreaInsets.bottom)
                                .padding(.leading, geo.safeAreaInsets.leading)
                                .padding(.trailing, geo.safeAreaInsets.trailing)
                        )
                    }
                )
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
