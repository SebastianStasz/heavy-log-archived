//
//  BaseListView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 27/07/2021.
//

import SwiftUI

struct BaseListView: View {

    let title: String
    @ObservedObject var viewModel: BaseListVM

    init(title: String, viewModel: BaseListVM) {
        self.title = title
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title).textHeadlineBig

            ZStack(alignment: .top) {
                VStack(spacing: .spacingMedium) {
                    ForEach(viewModel.rows) { row in
                        BaseListRowView(row: row)
                            .onNavigation { viewModel.open(row) }
                            .allowsHitTesting(row.isClicable)
                        DividerMain(color: .grayLightPrimary)
                    }
                }
                .padding(.top, .spacingMedium)
            }
        }
    }
}


// MARK: - Preview

struct BaseListView_Previews: PreviewProvider {
    static var previews: some View {
        let rows: [BaseListRowViewData] = [.sample1, .sampleC2, .sampleC3, .sample1, .sampleC2, .sampleC3, .sample1, .sampleC2, .sampleC3, .sample1, .sampleC2, .sampleC3, .sample1, .sampleC2, .sampleC3, .sample1, .sampleC2, .sampleC3, .sample1, .sampleC2, .sampleC3, .sample1, .sampleC2, .sampleC3]
        let viewModel = BaseListVM(parent: SummaryVM())
        viewModel.rows = rows
        return BaseListView(title: "Body Measurements", viewModel: viewModel)
            .padding()
            .embedInScrollView()
            .background(Color.backgroundMain.edgesIgnoringSafeArea(.all))
    }
}
