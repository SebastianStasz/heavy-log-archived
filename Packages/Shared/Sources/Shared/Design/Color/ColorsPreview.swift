//
//  ColorsPreview.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 03/09/2021.
//

import SwiftUI

struct ColorsPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: .spacingHuge) {
                ForEach(ColorDesign.groups, content: colorList)
            }
        }
    }

    private func colorList(for group: ColorDesign) -> some View {
        VStack(alignment: .leading, spacing: .spacingBig) {
            Text(group.title)
                .padding(.leading, .spacingBig)

            VStack(spacing: .spacingMedium) {
                ForEach(group.colors, id: \.id) { color in
                    ZStack {
                        Rectangle()
                            .fill(color.color)
                            .frame(height: 50)
                        Text(color.rawValue)
                            .font(.caption)
                            .opacity(0.3)
                    }
                }
            }
        }
    }
}


// MARK: - Preview

struct ColorsPreview_Previews: PreviewProvider {
    static var previews: some View {
        ColorsPreview()
    }
}
