//
//  BaseListView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 27/07/2021.
//

import SwiftUI

struct BaseListView: View {

    let title: LocalizedStringKey
    @ObservedObject var viewModel: BaseListVM

    var body: some View {
        VStack(alignment: .leading, spacing: .spacingBig) {
            Text(title).textHeadlineBig

            ScrollView {
                LazyVStack(spacing: .spacingMedium) {
                    ForEach(viewModel.rows) { row in
                        if row.isClicable {
                            BaseListRowView(row: row)
                                .onNavigation { viewModel.open(row) }
                        } else {
                            BaseListRowView(row: row)
                        }

                        DividerMain(color: .grayMedium)
                    }
                }
            }
            .padding(.horizontal, .spacingMedium)
        }
    }
}


// MARK: - Preview

struct BaseListView_Previews: PreviewProvider {
    static var previews: some View {
        let rows: [BaseListRow] = [.sampleC1, .sampleC2, .sampleC3]
        let viewModel = BaseListVM(parent: SummaryVM())
        viewModel.rows = rows
        return BaseListView(title: "Body Measurements", viewModel: viewModel)
                .padding()
    }
}
