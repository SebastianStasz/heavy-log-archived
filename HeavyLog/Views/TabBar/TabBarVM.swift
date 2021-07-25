//
//  TabBarVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Foundation

final class TabBarVM: ObservableObject {
    typealias Tab = TabBarModel

    @Published var selectedTab: Tab = .dashboard
    @Published var arePopupsShown = false

    private unowned let parent: AppVM

    var availableTabs: [Tab] { Tab.allCases }

    init(parent: AppVM) {
        self.parent = parent
    }
}

// MARK: - Navigator

extension TabBarVM {

    enum Destination {
        case tab(Tab)
        case popupItems
        case view
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .tab(let tab):
            selectedTab = tab
        case .popupItems:
            arePopupsShown = true
        case .view:
            arePopupsShown = false
        }
    }
}
