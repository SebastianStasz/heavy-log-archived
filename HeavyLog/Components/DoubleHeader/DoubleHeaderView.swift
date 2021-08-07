//
//  DoubleHeaderView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 02/08/2021.
//

import SwiftUI

struct DoubleHeaderView: View {

    let title: String
    let subtitle: String
    let color: Color

    // MARK: - View

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title).textHeadlineSmall
                Spacer()
                Text(subtitle).textFootnoteMain
            }

            DividerMain(color: color, paddingTop: .spacingSmall, paddingBottom: .spacingMedium)
        }
    }
}


// MARK: - Preview

struct DoubleHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleHeaderView(viewData: .sample1)
            .previewLayout(.sizeThatFits)
    }
}
