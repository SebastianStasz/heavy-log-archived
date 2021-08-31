//
//  RatePicker.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import HeavyLogCoreData
import SwiftUI

struct RatePicker<T: RatePickerSupport>: View {

    let title: String
    @Binding var selectedValue: T

    private let maxValue: Double = Double(T.possibleCases.count)

    var body: some View {
        VStack(spacing: .spacingMedium) {
            rateIndicator
            segmentedPicker
        }
        .addHeadlineBig(title)
    }

    // MARK: - Logic

    private var selectedCaseValue: Double {
        Double(T.possibleCases.firstIndex(of: selectedValue) ?? -1) + 1
    }

    private var multiplier: CGFloat {
        CGFloat(selectedCaseValue / maxValue)
    }

    // MARK: - Rate Indicator

    var rateIndicator: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geo in
                ValueIndicator(color: .grayLightPrimary, width: .infinity)
                ValueIndicator(color: selectedValue.color, width: geo.size.width * multiplier)
            }
        }
        .frame(height: 10)
    }

    // MARK: - Segmented Picker

    var segmentedPicker: some View {
        Picker(title, selection: $selectedValue) {
            ForEach(T.possibleCases) {
                Text($0.name).tag($0)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }

    // MARK: - Value Indicator

    struct ValueIndicator: View {
        let color: Color
        let width: CGFloat

        var body: some View {
            RoundedRectangle(cornerRadius: .cornerRadiusBase)
                .fillColor(color)
                .maxWidth(width)
                .animation(.easeInOut)
        }
    }
}


// MARK: - Preview

struct WorkoutRatePicker_Previews: PreviewProvider {
    static var previews: some View {
        RatePicker(title: "Workout rating", selectedValue: .constant(WorkoutRate.good))
            .previewSizeThatFits(backgroundColor: .backgroundMain)
    }
}
