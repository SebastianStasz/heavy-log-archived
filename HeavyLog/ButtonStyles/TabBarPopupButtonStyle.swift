//
//  TabBarPopupButtonStyle.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Shared
import SwiftUI

struct TabBarPopupButtonStyle: ButtonStyle {

    let image: String

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .foregroundColor(AppColor.accentRedLight.color)

            Image(systemName: image)
                .foregroundColor(AppColor.accentMain.color)
                .font(.system(size: 19, weight: .medium))
        }
        .shadow(color: .black.opacity(0.02), radius: 5)
    }
}
