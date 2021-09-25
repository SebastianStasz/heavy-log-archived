//
//  BaseListRowView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 27/07/2021.
//

import SwiftUI

struct BaseListRowView: View {

    let row: BaseListRowViewData

    var body: some View {
        HStack(spacing: 0) {
            if let image = row.image {
                image
                    .scaledToFit(width: 20)
                    .padding(.trailing, .spacingMedium)
            }

            Text(row.title).textBodyMedium
            Spacer()
            Text(row.value).textBodyNormal

            Chevron().displayIf(row.isClicable)
        }
    }
}


// MARK: - Preview

struct ListBaseRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BaseListRowView(row: .sampleC1)
            BaseListRowView(row: .sampleC2)
            BaseListRowView(row: .sample3)
            BaseListRowView(row: .sampleIC1)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
