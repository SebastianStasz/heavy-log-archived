//
//  ExerciseTileView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct ExerciseTileView: View {

    let title: String

    var body: some View {
        HStack(spacing: 0) {
            Text(title).textBodyNormal
            Spacer()
            Chevron()
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
            ExerciseTileView(title: "Bench press")
            ExerciseTileView(title: "Very long exercise name here, very long lo")
        }
        .previewSizeThatFits()
    }
}
