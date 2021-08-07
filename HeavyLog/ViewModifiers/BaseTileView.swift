//
//  BaseTileView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 02/08/2021.
//

import SwiftUI

struct BaseTileView: ViewModifier {

    let headerViewData: DoubleTextHeaderViewData

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            DoubleTextHeader(viewData: headerViewData)
            content
        }
        .padding(.spacingMedium)
        .background(Color.backgroundSecondary)
        .cornerRadius(.cornerRadiusBase)
    }
}

extension View {
    func embedInBaseTileView(headerViewData: DoubleTextHeaderViewData) -> some View {
        self.modifier(BaseTileView(headerViewData: headerViewData))
    }
}
