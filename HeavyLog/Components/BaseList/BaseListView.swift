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
        VStack(alignment: .leading, spacing: 0) {
            Text(title).textHeadlineBig

            ZStack(alignment: .top) {
                ScrollView {
                    LazyVStack(spacing: .spacingMedium) {
                        ForEach(viewModel.rows) { row in
                            BaseListRowView(row: row)
                                .onNavigation { viewModel.open(row) }
                                .allowsHitTesting(row.isClicable)
                            DividerMain(color: .grayMedium)
                        }
                    }
                    .padding(.top, .spacingMedium)
                }

                // Header spacing gradient
                Rectangle()
                    .fill(linearGradient)
                    .frame(height: .spacingMedium)
            }
            .padding(.horizontal, .spacingMedium)
        }
    }

    private var linearGradient: LinearGradient {
        LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }

    private var gradient: Gradient {
        Gradient(colors: [.backgroundMain, .backgroundMain, .backgroundMain.opacity(0.1)])
    }
}


// MARK: - Preview

struct BaseListView_Previews: PreviewProvider {
    static var previews: some View {
        let rows: [BaseListRowViewData] = [.sampleC1, .sampleC2, .sampleC3]
        let viewModel = BaseListVM(parent: SummaryVM())
        viewModel.rows = rows
        return BaseListView(title: "Body Measurements", viewModel: viewModel)
                .padding()
                .background(Color.backgroundMain.edgesIgnoringSafeArea(.all))
    }
}
