//
//  RecordRowView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import HeavyLogCoreData
import SwiftUI

struct RecordRowView: View {

    let title: String
    let subtitle: String
    let footnote: String
    let repsIndicatorView: ValueIndicatorSquareView

    // MARK: - View

    var body: some View {
        HStack(alignment: .bottom, spacing: .spacingMedium) {

            repsIndicatorView

            VStack(alignment: .leading) {
                Text(title).textBodyMedium
                Spacer()
                HStack {
                    Text(subtitle).textBodyNormal
                    Spacer()
                    Text(footnote).textFootnoteMain
                }
            }
        }
        .frame(height: 49)
    }
}

// MARK: - Initializers

extension RecordRowView {
    init(record: Record) {
        title = record.exerciseName
        subtitle = record.valueStr
        footnote = record.date.string(format: .medium)
        repsIndicatorView = ValueIndicatorSquareView(reps: record.reps)
    }
}


// MARK: - Preview

struct RecordRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            RecordRowView(record: .sampleSquatX1)
            RecordRowView(record: .sampleSquatX3)
            RecordRowView(record: .sampleSquatX5)
            RecordRowView(record: .sampleDeadliftX1)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
