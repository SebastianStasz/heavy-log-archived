//
//  WorkoutSmallTileView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct WorkoutSmallTileView: View {

    let viewData: WorkoutSmallTileViewData

    var body: some View {
        VStack(spacing: .spacingSmall) {
            DoubleTextBase(viewData: viewData.doubleTextViewData)

            Button("Show workout") {

            }
            .buttonStyle(DefaultButtonStyle())
        }
        .embedInBaseTileView(headerViewData: viewData.headerViewData)
    }
}


// MARK: - Preview

struct WorkoutSmallTileView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSmallTileView(viewData: .sample1)
            .previewSizeThatFits()
    }
}
