//
//  SummaryView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

struct SummaryView: View {

    @StateObject var viewModel = SummaryVM()
    @StateObject private var recordsVM = HorizontalPaginationVM<RecordTile>(items: [
        .powerliftingX1, .powerliftingX3, .powerliftingX5
    ], tileWidth: 290)

    var body: some View {
        VStack(spacing: .spacingHuge) {
            HorizontalPaginationView(viewModel: recordsVM, itemView: RecordTileView.init)

            BaseListView(title: "Body Measurements", viewModel: viewModel.baseListVM)
                .navigation(item: $viewModel.listItemVM) { Text($0.title) }
                .padding(.horizontal, .spacingMedium)
        }
        .padding(.top, .spacingMedium)
        .embedInScrollView()
        .background(Color.backgroundMain.edgesIgnoringSafeArea(.all))
    }
}


// MARK: - Preview

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
            .embedInNavigationView(title: "Summary", displayMode: .automatic)
    }
}
