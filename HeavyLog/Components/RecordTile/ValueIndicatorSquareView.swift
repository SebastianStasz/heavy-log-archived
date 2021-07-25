//
//  ValueIndicatorSquareView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import SwiftUI

struct ValueIndicatorSquareView: View {

    let value: String
    let valueColor: Color
    let squareColor: Color

    var body: some View {
        Rectangle()
            .cornerRadius(.cornerRadiusBase)
            .overlay(valueIndicatorView)
            .foregroundColor(squareColor)
            .frame(width: 49, height: 49)
    }

    var valueIndicatorView: some View {
        Text(value)
            .textOutstanding
            .foregroundColor(valueColor)
    }
}

// MARK: - Initializers

extension ValueIndicatorSquareView {
    init(reps: Reps) {
        value = reps.indicator
        valueColor = reps.color
        squareColor = reps.colorLight
    }
}


// MARK: - Preview

struct SquareValueIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            ValueIndicatorSquareView(reps: .one)
            ValueIndicatorSquareView(reps: .three)
            ValueIndicatorSquareView(reps: .five)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
