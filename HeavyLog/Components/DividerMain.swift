//
//  DividerMain.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 26/07/2021.
//

import SwiftUI

struct DividerMain: View {

    private let color: Color

    init(color: Color = .grayLight) {
        self.color = color
    }

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: 1)
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
