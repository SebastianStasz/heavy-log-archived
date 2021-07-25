//
//  TabBarView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

struct TabBarView: View {

    @ObservedObject private var tabBar: TabBarVM
    private let backgroundColor = AppColor.backgroundMain.color

    init(viewModel: TabBarVM) {
        tabBar = viewModel
        UITabBar.appearance().isHidden = true
    }

    // MARK: - View

    var body: some View {
        VStack(spacing: 0) {
            // TabView
            TabView(selection: $tabBar.selectedTab ) {
                ForEach(tabBar.availableTabs) { $0 }
                    .infiniteFrame()
                    .backgroundIgnoringSafeArea(backgroundColor)
            }
            .allowsHitTesting(!tabBar.arePopupsShown)

            // TabBar
            HStack(spacing: 0) {
                ForEach(tabBar.availableTabs) { tab in
                    if isMiddleElement(tab.id) { buttonShowAddingButtons }
                    buttonSwitchToTab(tab)
                }
            }
            .infiniteWidth(maxHeight: 49)
            .background(tabBarBackground)
        }
        .background(backgroundColor)
    }

    // MARK: View Components

    private var tabBarBackground: some View {
        AppColor.backgroundSecondary.color
            .cornerRadius(15)
            .edgesIgnoringSafeArea(.bottom)
            .shadow(color: .black.opacity(0.05), radius: 5)
    }

    // MARK: Interactions

    private var buttonShowAddingButtons: some View {
        TabBarActionButton(tabBar: tabBar).offset(y: -14)
    }

    private func buttonSwitchToTab(_ tab: TabBarModel) -> some View{
        Button(tab.title, action: tabBar.navigate(to: .tab(tab)))
            .buttonStyle(TabBarButtonStyle(for: tab, isSelected: isTabSelected(tab)))
    }

    // MARK: Helpers

    private func isTabSelected(_ tab: TabBarModel) -> Bool {
        tabBar.selectedTab == tab
    }

    func isMiddleElement(_ element: Int) -> Bool {
        element == tabBar.availableTabs.count / 2
    }

    private var isMenuShow: Bool {
        tabBar.arePopupsShown
    }
}


// MARK: - Preview

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TabBarVM(parent: AppVM())
        TabBarView(viewModel: viewModel)
    }
}

