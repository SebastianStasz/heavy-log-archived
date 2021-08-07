//
//  DoubleTextBase.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct DoubleTextBase: View {

    let viewData: DoubleTextViewData

    var body: some View {
        HStack(spacing: 0) {
            Text(viewData.leftText).textBodyMedium
            Spacer()
            Text(viewData.rightText).textBodyNormal
        }
    }
}


// MARK: - Preview

struct DoubleTextBase_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTextBase(viewData: .init("Left text", "Right text"))
            .previewLayout(.sizeThatFits)
    }
}
