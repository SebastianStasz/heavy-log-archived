//
//  WorkoutTileView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 26/07/2021.
//

import SwiftUI

struct WorkoutTileView: View {

    let viewData: WorkoutTileViewData

    // MARK: - View

    var body: some View {
        VStack(spacing: .spacingSmall) {
            ForEach(viewData.doubleTextRows, id: \.self) {
                DoubleTextBase(viewData: $0)
                    .overlay(getGradient(isLast: viewData.isLast($0)))
            }

            Button("Show workout") {

            }
            .buttonStyle(DefaultButtonStyle())
        }
        .embedInBaseTileView(headerViewData: viewData.headerViewData)
    }

    private func getGradient(isLast: Bool) -> LinearGradient {
        let gradient = Gradient(colors: [.white, .white.opacity(0)])
        let empty = Gradient(colors: [])
        return LinearGradient(gradient: isLast ? gradient : empty, startPoint: .bottom, endPoint: .top)
    }
}


// MARK: - Preview

struct WorkoutTileBig_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorkoutTileView(viewData: .sample1)
        }
        .padding()
        .background(Color.gray.opacity(0.7))
        .previewLayout(.sizeThatFits)
    }
}
