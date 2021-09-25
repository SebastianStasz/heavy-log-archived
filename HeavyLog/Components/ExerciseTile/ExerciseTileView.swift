//
//  ExerciseTileView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct ExerciseTileView: View {

    let viewData: ExerciseTileViewData

    var body: some View {
        HStack(spacing: .spacingMedium) {
            Text(viewData.title).textBodyNormal
            Spacer()
            viewData.icon
        }
        .lineLimit(1)
        .padding(.spacingMedium)
        .background(Color.basicPrimary)
        .cornerRadius(.cornerRadiusBase)
    }
}


// MARK: - Preview

struct ExerciseTileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExerciseTileView(viewData: .benchPressNone)
            ExerciseTileView(viewData: .benchPressPlus)
            ExerciseTileView(viewData: .benchPressChevron)
            ExerciseTileView(viewData: .sampleLongNone)
        }
        .previewSizeThatFits()
    }
}
