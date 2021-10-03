//
//  DividerMain.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 26/07/2021.
//

import SwiftUI

struct DividerMain: View {

    private let color: Color
    private let paddingTop: CGFloat
    private let paddingBottom: CGFloat

    init(color: Color = .grayLightSecondary, paddingTop: CGFloat = 0, paddingBottom: CGFloat = 0) {
        self.color = color
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
    }

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: 1)
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)
    }
}

extension DividerMain {
    init(color: Color = .grayLightSecondary, spacing: CGFloat = 0) {
        self.init(color: color, paddingTop: spacing, paddingBottom: spacing)
    }
}


// MARK: - Preview

struct DividerMain_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 50) {
            DividerMain(color: .accentRed)
            DividerMain(color: .accentGreen)
            DividerMain(color: .accentOrange)
            DividerMain()
        }
        .padding(50)
        .previewLayout(.sizeThatFits)
    }
}
