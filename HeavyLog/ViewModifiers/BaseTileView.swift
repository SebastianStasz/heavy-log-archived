//
//  BaseTileView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 02/08/2021.
//

import SwiftUI

struct BaseTileView: ViewModifier {

    let headerViewData: DoubleHeaderViewData

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            DoubleHeaderView(viewData: headerViewData)
            content
        }
        .padding(.spacingMedium)
        .background(Color.backgroundSecondary)
        .cornerRadius(.cornerRadiusBase)
    }
}

extension View {
    func embedInBaseTileView(headerViewData: DoubleHeaderViewData) -> some View {
        self.modifier(BaseTileView(headerViewData: headerViewData))
    }
}
