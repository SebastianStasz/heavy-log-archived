//
//  RecordTileView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import SwiftUI

struct RecordTileView: View {

    private let title: String
    private let records: [Record]
    private var emptyMessage: String?

    var body: some View {
        VStack(alignment: .leading, spacing: .spacingBig) {
            Text(title).textHeadlineSmall

            VStack(spacing: .spacingMedium) {
                RecordRowView(record: records[0])
                Divider()
                if records.indices.contains(1) {
                    RecordRowView(record: records[1])
                    Divider()
                    if records.indices.contains(2) {
                        RecordRowView(record: records[2])
                    }
                }

                if let msg = emptyMessage {
                    Text(msg).textBodyThin
                        .frame(maxHeight: .infinity)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .padding(.spacingMedium)
        .frame(height: 291)
        .background(AppColor.backgroundSecondary.color)
        .cornerRadius(.cornerRadiusBase)
    }

    // MARK: Init

    init?(title: String, records: [Record]) {
        let numOfRecords = records.count
        guard numOfRecords > 0 else {
            assert(numOfRecords > 0, "Initialization with empty records array should be avoided.")
            return nil
        }

        guard numOfRecords < 4 else {
            assert(numOfRecords < 4, "Records above 3 won't be presented.")
            return nil
        }

        self.title = title
        self.records = records

        if numOfRecords == 2 { emptyMessage = "Keep it up!" }
        else if numOfRecords == 1 { emptyMessage = "You're on the irght track!" }
    }
}

extension RecordTileView {
    init?(recordTile: RecordTile) {
        self.init(title: recordTile.title, records: recordTile.records)
    }
}


// MARK: - Preview

struct RecordTileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let recordsFull = [Record.sampleSquatX1, Record.sampleSquatX3, Record.sampleSquatX5]
            RecordTileView(title: "Squats", records: recordsFull)

            let recordsEmpty1 = [Record.sampleSquatX1, Record.sampleSquatX3]
            RecordTileView(title: "Squats", records: recordsEmpty1)

            let recordsEmpty2 = [Record.sampleSquatX1]
            RecordTileView(title: "Squats", records: recordsEmpty2)
        }
        .previewLayout(.sizeThatFits)
    }
}
