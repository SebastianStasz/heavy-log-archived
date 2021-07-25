//
//  SummaryView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

struct SummaryView: View {

    @StateObject private var recordsVM = HorizontalPaginationVM<RecordTile>(items: [
        .powerliftingx1, .powerliftingx3, .powerliftingx5
    ], tileWidth: 290)

    var body: some View {
        VStack {
            HorizontalPaginationView(viewModel: recordsVM, itemView: RecordTileView.init)
        }
    }
}


// MARK: - Preview

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
