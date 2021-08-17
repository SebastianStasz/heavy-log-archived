//
//  TabBarActionButton.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Shared
import SwiftUI

struct TabBarActionButton: View {
    typealias Popup = TabBarModel.Popup

    @ObservedObject var tabBar: TabBarVM

    // MARK: - View

    var body: some View {
        Button("Add", action: tabBar.arePopupsShown.toggle())
            .buttonStyle(TabBarActionButtonStyle(isEnabled: tabBar.arePopupsShown))
            .disableInteractions(settings: interactionBlockerSettings)
    }

    private var popupButtons: some View {
        Group {
            popupButton(Popup.first, angle: -90, action: {})
            popupButton(Popup.second, angle: -135, action: {})
            popupButton(Popup.third, angle: -45, action: {})
        }
    }

    // MARK: Interactions

    private func popupButton(_ popup: Popup, angle: Double, action: @escaping () -> Void) -> some View {
        let offset = getOffset(for: angle)

        return Button(popup.title, action: action())
            .buttonStyle(TabBarPopupButtonStyle(image: popup.image))
            .offset(x: offset.x, y: offset.y)
            .frame(width: 47, height: 47)
            .animation(.easeInOut(duration: 0.2))
    }

    // MARK: - Helpers

    private var interactionBlockerSettings: InteractionBlocker.Settings {
        .init(when: $tabBar.arePopupsShown, onTopShow: AnyView(popupButtons), closingDuration: 0.2, isParentViewInteractive: true)
    }

    private func getOffset(for angle: Double) -> (x: CGFloat, y: CGFloat) {
        let theta = CGFloat(.pi * angle / 180)
        let x = 210 / 2 * cos(theta)
        let y = 150 / 2 * sin(theta)

        return (x: tabBar.arePopupsShown ? x : 0, y: tabBar.arePopupsShown ? y : 0)
    }
}


// MARK: - Preview

struct TabBarAddButton_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TabBarVM(parent: AppVM())
        ZStack {
            AppColor.backgroundMain.color
            TabBarActionButton(tabBar: viewModel)
                .frame(width: 50, height: 50)
        }
    }
}

