//
//  RecordRowView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import SwiftUI

struct RecordRowView: View {

    var title: String
    var subtitle: String
    var footnote: String
    var value: String
    var squareColor: Color
    var valueColor: Color

    var body: some View {
        HStack(alignment: .bottom, spacing: .spacingMedium) {

            ValueIndicatorSquareView(value: value, valueColor: valueColor, squareColor: squareColor)

            VStack(alignment: .leading) {
                Text(title).textBodyMedium
                Spacer()
                Text(subtitle).textBodyNormal
            }

            Spacer()

            Text(footnote).textFootnoteMain
        }
        .frame(height: 49)
    }
}


// MARK: - Preview

struct RecordRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecordRowView(title: "Squat", subtitle: "140 kg", footnote: "17 jul 2021", value: "x1", squareColor: .red.opacity(0.5), valueColor: .red)
    }
}
