//
//  PlusIcon.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import SwiftUI

struct PlusIcon: View {
    var body: some View {
        Image(systemName: "plus")
            .font(.callout.weight(.light))
            .foregroundColor(.grayMedium)
    }
}


// MARK: - Preview

struct PlusIcon_Previews: PreviewProvider {
    static var previews: some View {
        PlusIcon()
            .previewSizeThatFits(backgroundColor: .white)
    }
}
