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
            Text("Headline big")
                .textHeadlineBig

            Text("Headline small")
                .textHeadlineSmall

            Text("Body medium")
                .textBodyMedium

            Text("Body normal")
                .textBodyNormal

            Text("Footnote main")
                .textFootnoteMain

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
