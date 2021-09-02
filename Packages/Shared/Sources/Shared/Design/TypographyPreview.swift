//
//  TypographyPreview.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import SwiftUI

struct TypographyPreview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Headline big Bold")
                .textHeadlineBigBold

            Text("Headline big")
                .textHeadlineBig

            Text("Headline small")
                .textHeadlineSmall

            Text("Footnote main")
                .textFootnoteMain

            Text("Body bold")
                .textBodyBold

            Text("Body medium")
                .textBodyMedium

            Text("Body normal")
                .textBodyNormal

            Text("Text outstanding")
                .textOutstanding
        }
    }
}


// MARK: - Preview

struct TypographyPreview_Previews: PreviewProvider {
    static var previews: some View {
        TypographyPreview()
    }
}
