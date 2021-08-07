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
        Text(viewData.bodyParts).textBodyNormal
            .embedInBaseTileView(headerViewData: viewData.headerViewData)
    }
}


// MARK: - Preview

struct ExerciseTileView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTileView(viewData: .sample1)
            .previewSizeThatFits()
    }
}
