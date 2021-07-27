//
//  WorkoutBigTileView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 26/07/2021.
//

import SwiftUI

struct WorkoutBigTileView: View {

    private let title: String
    private let date: String
    private let color: Color
    private let efforts: [(String, String)]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title).textHeadlineSmall
                Spacer()
                Text(date).textFootnoteMain
            }

            DividerMain(color: color, paddingTop: .spacingSmall, paddingBottom: .spacingMedium)

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
        }
        .padding(.spacingMedium)
        .background(Color.backgroundSecondary)
        .cornerRadius(.cornerRadiusBase)
    }

    private func getGradient(isLast: Bool) -> LinearGradient {
        let gradient = Gradient(colors: [.white, .white.opacity(0)])
        let empty = Gradient(colors: [])
        return LinearGradient(gradient: isLast ? gradient : empty, startPoint: .bottom, endPoint: .top)
    }

    // MARK: - Initializer

    init?(title: String, date: String, color: Color, efforts: [(String, String)]) {
        guard efforts.isNotEmpty else {
            assertionFailure("Initialization with an empty efforts array should not happend.")
            return nil
        }
        self.title = title
        self.date = date
        self.color = color
        self.efforts = efforts
    }
}


// MARK: - Preview

struct WorkoutTileBig_Previews: PreviewProvider {
    static var previews: some View {
        let efforts = [("Deadlift", "150kg 3x1, 150kg x3 x2"), ("OHP", "40kg 4x8"), ("Machine leg extensions", "11kg 4x10"), ("Dumbbell rowing", "27.5kg 4x8")]

        Group {
            WorkoutBigTileView(title: "FBW A", date: Date().string(format: .medium), color: AppColor.accentOrangeLight.color, efforts: efforts)
        }
        .padding()
        .background(Color.gray.opacity(0.7))
        .previewLayout(.sizeThatFits)
    }
}
