//
//  WorkoutTileView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 26/07/2021.
//

import SwiftUI

struct WorkoutTileView: View {

    private let headerViewData: DoubleHeaderViewData
    private let efforts: [(String, String)]

    // MARK: - View

    var body: some View {
        VStack(spacing: .spacingSmall) {
            ForEach(efforts, id: \.self.0) { effort in
                HStack {
                    Text("\(effort.0):").textBodyMedium
                    Spacer()
                    Text(effort.1).textBodyNormal
                }
                .overlay(getGradient(isLast: effort == efforts.last!))
            }

            Button("Show workout") {

            }
            .buttonStyle(DefaultButtonStyle())
        }
        .embedInBaseTileView(headerViewData: headerViewData)
    }

    private func getGradient(isLast: Bool) -> LinearGradient {
        let gradient = Gradient(colors: [.white, .white.opacity(0)])
        let empty = Gradient(colors: [])
        return LinearGradient(gradient: isLast ? gradient : empty, startPoint: .bottom, endPoint: .top)
    }
}

// MARK: - Initializer

extension WorkoutTileView {
    init(viewData: WorkoutTileViewData) {
        headerViewData = .init(title: viewData.title, subtitle: viewData.date, color: viewData.color)
        efforts = viewData.efforts
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
